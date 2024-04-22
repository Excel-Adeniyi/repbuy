import { Request, Response, NextFunction } from 'express'
import axios, { AxiosError, AxiosResponse } from 'axios'
import myCache from '../../middleware/cache'
import PurchaseModel from '../../model/GetAirtimeModel/get_airtime_Model';

class GetDataController {
    private model: PurchaseModel


    constructor(model: PurchaseModel) {
        this.model = model
    }
    async GetData(req: Request, res: Response): Promise<void> {
        try {
            console.log("HLLL")
            let airtimeData = req.body
            console.log(airtimeData)
            const data = {
                userId: airtimeData.userId,
            }
            const dataReq = {
                operatorId: airtimeData.operatorId,
                amount: airtimeData.amount,
                recipientPhone: { countryCode: airtimeData.recipientPhone.countryCode, number: airtimeData.recipientPhone.number }
            }
            const successdata: any = await this.model.CHECKSuccessful(data)
            console.log("HECHECK",successdata)
            if(airtimeData.otp !== undefined) {
                const cachedD = myCache.get("AUTH_DATA_KEY");
                console.log("CACHE", cachedD);
                const axiosInstance = axios.create();
                const response: AxiosResponse = await axiosInstance.post('https://topups-sandbox.reloadly.com/topups-async ', dataReq,
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
                    const updatePurchaseTable = await this.model.GetPurchaseModel(data)
                    if (updatePurchaseTable !== undefined && updatePurchaseTable !== null) {
                        res.status(200).json({ Success: true, message: responseData})
                    }
                }
            }else {
                res.status(503).json({Success: false, message: "Unable to verify OTP"})
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


export default GetDataController