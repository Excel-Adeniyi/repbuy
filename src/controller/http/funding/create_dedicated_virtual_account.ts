import axios, { AxiosError, AxiosResponse } from "axios";
import { Request, Response } from "express";


class CreateDedicatedAccount {
    async CreateDedicatedAccount(req: Request, res: Response): Promise<void> {
        const { userid, acc_firstname, acc_lastname, acc_middle, account_number, phone_number, email, bvn, bank_code } = req.body;
        // const payload = req.body
        const axiosInstance = axios.create()
        const paysecret = process.env.PAY_SECRET
        try {
            console.log(paysecret)
            
            axiosInstance.interceptors.request.use(
                function (config) {
                    if (paysecret !== undefined) {
                        config.baseURL = "https://api.paystack.co"
                        config.headers.Authorization = `Bearer ${paysecret}`
                        config.headers["Content-Type"] = 'application/json'
                    }
                    return config
                }
            )
            const payload = {
                email,
                first_name: acc_firstname,
                middle_name: acc_middle,
                last_name: acc_lastname,
                phone: phone_number,
                preferred_bank: "wema",
                country: "NG",
                account_number: account_number,
                bvn: bvn,
                bank_code,
            }
            const response: AxiosResponse | any = axiosInstance.post("/dedicated_account", payload)
            if(response)
            res.status(200).json({Success: true, response})

            console.log(response)
        } catch (error: any) {
            console.log(error.message)
            if( axios.isAxiosError(error)){
               const axiosError = error as AxiosError

               if(axiosError.request){
                console.log( "Server responded with non-2xx status (408):", axiosError.request)
                res.status(408).json({Success: false, message: axiosError.request})
               } else if(axiosError.response){
                console.log("Server responded with non-2xx status (503):", axiosError.response)
                res.status(503).json({Success: false, message: axiosError.response})
               }else{
                console.log("Server responded with non-2xx status (500):", error)
                res.status(500).json({Success:false, message: error.message})
               }
            }
        }
    }
}

export default CreateDedicatedAccount