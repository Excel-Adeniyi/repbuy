import axios, { AxiosError, AxiosResponse } from "axios";
import { Request, Response } from "express";
import CurrentPurchaseModel from "../../../model/PaymentModel/current_purchase_select";
import { RowDataPacket } from "mysql2";

axios.interceptors.request.use((config: any) => {
    config.headers['Authorization'] = `Bearer ${process.env.PAY_SECRET}`;
    config.headers['Content-Type'] = 'application/json';
    config.headers.Accept = "application/json";
    return config;
})

class VerifyPaymnents {
    private model: CurrentPurchaseModel

    constructor(model: CurrentPurchaseModel){
        this.model = model
    }

    async verifyPayment(req: Request, res: Response): Promise<void> {
        const { reference, userId, accessCode } = req.body
        //console.log(reference)
        const data = {
            reference, userId, accessCode
        }
        //console.log("CHECKING THE VERIFIER",data)
        try {
            if (reference != undefined && reference != null) {
                const url = "https://api.paystack.co/transaction/verify/"

                const response: AxiosResponse = await axios.get(`${url}${reference}`);
                const responseData = response.data
                // //console.log("VERIFIER",responseData)
                if(responseData.message === "Verification successful"){
                    const updatePaymentSuccess: any = await this.model.UpdatePaymentTable(data)
                    //console.log("Update response", updatePaymentSuccess)
                    if(updatePaymentSuccess.affectedRows == 1) {
                        res.status(200).json({Success: true, message: responseData.data.status})
                    }else{
                        res.status(503).json({Success: false, message: "Issue processing Payments"})
                    }
                    
                }else{
                    res.status(503).json({Success: false, message: responseData.data.message})
                }
                // //console.log(responseData)
            }
        } catch (error) {
            //console.log(error)
            if(axios.isAxiosError(error)){
                const axiosError = error as AxiosError

                if(axiosError.response){
                    res.status(504).json({Success:false, message: "Gateway Timeout"})
                } else if (axiosError.request) {
                    res.status(400).json({Success: false, message: "Bad Request" })
                }else{
                    res.status(500).json({ Success: false, message: "Internal Server Error"})
                }
            }
        }
    }
}

export default VerifyPaymnents