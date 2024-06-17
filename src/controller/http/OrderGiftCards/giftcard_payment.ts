import { Request, Response } from "express";
import myCache from "../../../middleware/cache";
import axios, { AxiosError, AxiosResponse } from "axios";
import GiftcardUpdatePostPayent from "../../../model/GiftCardModel/giftcard_update_after_payment";


class GiftcardProcessPurchase {
    private model: GiftcardUpdatePostPayent

    constructor(model: GiftcardUpdatePostPayent){
        this.model = model
    }

    async processPayment(req: Request, res: Response): Promise<void> {
        const cachedData: string | undefined = myCache.get("AUTH_GIFTCARD_KEY");
        const endpoint = 'https://giftcards-sandbox.reloadly.com/orders'

        try {
            const payload_giftcard = req.body
            //console.log({ ...payload_giftcard })
            const payload = {
                unitPrice: payload_giftcard.unitPrice,
                quantity: payload_giftcard.quantity,
                productId: payload_giftcard.productId,
                customIdentifier: payload_giftcard.customIdentifier,
                senderName: payload_giftcard.senderName,
                recipientPhoneDetails: {
                    countryCode: payload_giftcard.recipientPhoneDetails.countryCode,
                    phoneNumber: payload_giftcard.recipientPhoneDetails.phoneNumber
                }
            }
            //console.log("CACHE", cachedData)
            //console.log("PAYLOAD", payload)
            if (cachedData !== undefined && payload_giftcard !== undefined) {
                const axiosInstance = axios.create()
                const responseAxios: AxiosResponse = await axiosInstance.post(endpoint, payload, {
                    headers: {
                        'Accept': 'application/com.reloadly.giftcards-v1+json',
                        'Authorization': `Bearer ${cachedData}`,
                        'Content-Type': 'application/json'
                    }
                })
              
                if (responseAxios.data.status === "SUCCESSFUL") {
                    //console.log(responseAxios.data)
                    const params = {
                        status: 'successful',
                        success: 1,
                        ntransactionId: responseAxios.data.customIdentifier
                    }
                    this.model.updateBothModel(params)
                    res.status(200).json({ Success: true, message: responseAxios.data })
                } else {
                    res.status(503).json({ Success: false, message: "Unable to generate response at this time" })
                }
            } else {
                res.status(401).json({ Success: false, message: "Request Denied" })
            }


        } catch (error: any) {
            //console.log(Error)
            if (axios.isAxiosError(error)) {
                const axiosError = error as AxiosError

                if (axiosError.response) {
                    const responseError = axiosError.response.data as ({ message: string })
                    //console.log('Error RESPONSE', axiosError.response.data)
                    res.status(503).json({ Success: false, message: "Unable to generate response at this time try later" })
                } else if (axiosError.request) {
                    const requestError = axiosError.request.data as ({ message: string })
                    //console.log("Error REQUEST", axiosError.request.data)
                    res.status(408).json({ Success: false, message: "Unable to proccess request at this time try later" })
                } else {
                    //console.log(error)
                    res.status(500).json({ Success: false, message: " Internal Server error" })
                }
            }
        }
    }
}

export default GiftcardProcessPurchase