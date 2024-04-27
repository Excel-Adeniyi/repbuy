// https://utilities-sandbox.reloadly.com/pay

import axios, { AxiosError } from "axios";
import { Request, Response } from "express";
import myCache from "../../../middleware/cache";

class UtilityPayment {


    async ubiller(req: Request, res: Response): Promise<void> {
        try {
            const utilityData = req.body
            const cacheDb: string | undefined = myCache.get("AUTH_UTILITY_KEY")
            console.log(cacheDb)
            if (utilityData !== undefined && cacheDb !== undefined) {
                const axiosInstance = axios.create()
                const response: any = await axiosInstance.post('https://utilities-sandbox.reloadly.com/pay',
                    { ...utilityData },
                    {
                        headers: {
                            "Accept": "application/com.reloadly.utilities-v1+json",
                            "Content-Type": "application/json",
                            Authorization: `Bearer ${cacheDb}`
                        }
                    },
                )

                if(response !== undefined ){
                    res.status(200).json({Success: true, message: response.data })
                }else{
                    res.status(503).json({Success: false , message: "Unable to get response"})
                }

            }
            console.log(utilityData)
        } catch (error: any) {
            if(axios.isAxiosError(error)){
                const axiosError = error as AxiosError

                if(axiosError.response){
                    const responseData = axiosError.response.data as ({message: string})
                    console.log('Response Error',responseData)
                    res.status(503).json({Success: false, message: "Unable to get response"})
                }else if (axiosError.request){
                    const requestData = axiosError.request.data as ({message:string})
                    console.log('Request Error', requestData)
                    res.status(500).json({Success: false, message: "Unable to make request"})
                }else {
                    res.status(500).json({ Success: false, message: "Internal error has occured"})
                }
            }else {
                console.log(error.message)
                res.status(500).json({Success: false, message: "Internal Server error"})
            }
           
        }
    }
}

export default UtilityPayment