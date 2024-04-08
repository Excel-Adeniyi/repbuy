import { Request, Response, NextFunction } from 'express'
import axios, { AxiosError, AxiosResponse } from 'axios'
import myCache from '../middleware/cache'
import AirtimeDataClass from '../model/GetAirtime/get_airtime_Model';

class GetAirtimeController {
    private model: AirtimeDataClass


    constructor(model: AirtimeDataClass) {
        this.model = model
    }
    async GetAirtime(req: Request, res: Response): Promise<void> {
        try {

            let airtimeData = req.body
            console.log(airtimeData)
            const dataOTP = {
                otp: airtimeData.otp,
                userId: airtimeData.userId
            }
            const modelResult = await this.model.CHECKOTP(dataOTP)
            console.log(modelResult)
            if (modelResult !== null && modelResult !== undefined && modelResult.length > 0) {
                const otpTime = modelResult[0].time
                // console.log(otpTime)
                const currentTime = new Date().getTime()
                const toUpdatedTime = new Date(otpTime.getTime() + (1 * 60 * 60 * 1000))
                const otpDate = otpTime.toLocaleDateString()
                const currentDate = new Date().toLocaleDateString()
                const verifyTime = new Date(toUpdatedTime.getTime() + (15 * 60 * 1000))
                const correctedTime = verifyTime.getTime()
                if (otpDate === currentDate) {
                    console.log("BIG", { currentTime, correctedTime })
                    if (currentTime < correctedTime) {
                        console.log("US")
                        const dataReq = {
                            operatorId: airtimeData.operatorId,
                            amount: airtimeData.amount,
                            recipientPhone: { countryCode: airtimeData.recipientPhone.countryCode, number: airtimeData.recipientPhone.number }
                        }
                        const cachedD = myCache.get("AUTH_DATA_KEY");

                        const response: AxiosResponse = await axios.post('https://topups-sandbox.reloadly.com/topups-async ', dataReq,
                            {
                                headers: {
                                    'Authorization': `Bearer ${cachedD}`,
                                    'Content-Type': 'Application/json'
                                }
                            }
                        )
                        const responseData = response.data
                        console.log(responseData)
                        if (responseData.transactionId != undefined && responseData.transactionId != null) {
                            const data = {
                                transactionId: responseData.transactionId,
                                userId: airtimeData.userId
                            }
                            const updatePurchaseTable = await this.model.GetAirtimeModel(data)
                            // console.log(updatePurchaseTable)
                            if (updatePurchaseTable !== undefined && updatePurchaseTable !== null) {
                                res.json(responseData)
                            }
                        }
                    } else {

                        res.status(500).json("OTP Timed out")
                    }
                } else {
                    console.log("US")
                    const dataReq = {
                        operatorId: airtimeData.operatorId,
                        amount: airtimeData.amount,
                        recipientPhone: { countryCode: airtimeData.recipientPhone.countryCode, number: airtimeData.recipientPhone.number }
                    }
                    const cachedD = myCache.get("AUTH_DATA_KEY");

                    const response: AxiosResponse = await axios.post('https://topups-sandbox.reloadly.com/topups-async ', dataReq,
                        {
                            headers: {
                                'Authorization': `Bearer ${cachedD}`,
                                'Content-Type': 'Application/json'
                            }
                        }
                    )
                    const responseData = response.data
                    console.log(responseData)
                    if (responseData.transactionId != undefined && responseData.transactionId != null) {
                        const data = {
                            transactionId: responseData.transactionId,
                            userId: airtimeData.userId
                        }
                        const updatePurchaseTable = await this.model.GetAirtimeModel(data)
                        // console.log(updatePurchaseTable)
                        if (updatePurchaseTable !== undefined && updatePurchaseTable !== null) {
                            res.json(responseData)
                        }
                    }

                }
            } else {
                res.status(500).json("Invalid OTP")
            }
        } catch (error: any) {
            // console.log(error)
            if (axios.isAxiosError(error)) {
                const axiosError = error as AxiosError

                if (axiosError.response) {

                    const responseData = axiosError.response.data as ({ message: string })
                    console.log('Server response with a non-2xx status', responseData.message)
                    res.status(500).json({ axiosError: responseData.message })
                } else if (axiosError.request) {
                    // console.log('Server reequest Error ', axiosError.request)
                    res.status(500).json({ axiosError: 'Server Error 500' })
                } else {
                    console.log('Server with status code 500', axiosError.message)
                    res.status(500).json({ axiosError: 'Internal Server error' })
                }
            }
            else {
                console.log('Internal server error', (error as Error).message)
                res.status(500).json({ error: 'Internal server error' })
            }
        }
    }
}


export default GetAirtimeController