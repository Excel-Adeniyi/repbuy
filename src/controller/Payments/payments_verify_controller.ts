import axios, { AxiosResponse } from "axios";
import { Request, Response } from "express";

axios.interceptors.request.use((config: any) => {
    config.headers['Authorization'] = `Bearer ${process.env.PAY_SECRET}`;
    config.headers['Content-Type'] = 'application/json';
    config.headers.Accept = "application/json";
    return config;
})

class VerifyPaymnents {
    async verifyPayment(req: Request, res: Response): Promise<void> {
        const { reference } = req.params

        try {
            if (reference != undefined && reference != null) {
                const url = "https://api.paystack.co/transaction/verify/"

                const response: AxiosResponse = await axios.get(`${url}${reference}`);
                console.log(response)
            }
        } catch (error) {
            console.log(error)
        }
    }
}

export default VerifyPaymnents