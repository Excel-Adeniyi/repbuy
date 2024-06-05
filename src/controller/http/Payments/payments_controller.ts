import { Request, Response } from "express";
import { reference } from "../../../helper/reference";
import CurrentPurchaseModel from "../../../model/PaymentModel/current_purchase_select";
import axios, { AxiosError } from "axios";


class PaymentController {
    private model: CurrentPurchaseModel


    constructor(model: CurrentPurchaseModel) {
        this.model = model
    }
    async initializePayment(req: Request, res: Response): Promise<void> {
        const { amount, userId, email } = req.body
        
        const referenceInfo = reference()
        const data = {
            amount, userId, email
        }
        const amountWhole = amount * 100
        console.log(data)
        axios.interceptors.request.use((config) => {
            config.headers.Authorization= `Bearer ${process.env.PAY_SECRET}`
            // console.log(config)
            return config

        })
        try {
            const sqlResponse = await this.model.SelectCurrentPurchase(data)
            const purchase_id = sqlResponse.length > 0 ? sqlResponse[0].id : undefined
            console.log(sqlResponse)
            const payload = {
                "amount": amountWhole,
                "email": email,
                "reference": referenceInfo
            }
            console.log('PAYLOAD', payload)
            if (purchase_id != undefined) {
                const response = await axios.post("https://api.paystack.co/transaction/initialize",

                    payload,
                )
                const responseData = response.data
                console.log(responseData)
                if (responseData.status == true) {
                    res.status(200).json({ success: true, message: responseData.data.access_code })
                    const params = {
                        userId,
                       accesscode: responseData.data.access_code,
                       referenceInfo
                    }
                    await this.model.InsertPaymentTableModel(params)
                }else{
                    res.status(200).json({ success: false, message: "Unable to initialize payment" })
                }
            }

        } catch (error) {
            console.log(error)
            if (axios.isAxiosError(error)) {
                const axiosError = error as AxiosError

                if (axiosError.response) {
                    res.status(503).json({ success: false, message: "Payment gateway is unresponsive" })
                } else if (axiosError.request) {
                    res.status(408).json({ success: false, message: "Payment is unsuccessful" })
                } else {
                    console.log(axiosError.message)
                    res.status(500).json({ success: false, message: "internal server error" })
                }
            }
        }

    }
}

export default PaymentController