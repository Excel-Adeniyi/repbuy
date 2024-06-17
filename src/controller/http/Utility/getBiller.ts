import axios, { AxiosError, AxiosResponse } from "axios";
import { Request, Response } from "express";
import myCache from "../../../middleware/cache";



async function UtilityBiller(req: Request, res: Response){
    try {
        let url: string = 'https://utilities-sandbox.reloadly.com/billers'
        const uAuth = myCache.get("AUTH_UTILITY_KEY")
        //console.log("uAuth", uAuth)
        const response: AxiosResponse = await axios.get(url,
            {
                headers: {
                    "Authorization": `Bearer ${uAuth}`,
                    "Content-Type": "Application/json"
                }
            }
            )
            const responseData = response.data;
            res.status(200).json(responseData)
    } catch (error: any) {
        if(axios.isAxiosError(error)){
            if (axios.isAxiosError(error)) {
                const axiosError = error as AxiosError
    
                if (axiosError.response) {
    
                    const responseData = axiosError.response.data as ({ message: string })
                    //console.log('Server response with a non-2xx status', responseData.message)
                    res.status(500).json({ axiosError: responseData.message })
                } else if (axiosError.request) {
                    //console.log('Server reequest Error ', axiosError.request)
                    res.status(500).json({ axiosError: 'Server Error 500' })
                } else {
                    //console.log('Server with status code 500', axiosError.message)
                    res.status(500).json({ axiosError: 'Internal Server error' })
                }
            }
            else {
                //console.log('Internal server error', (error as Error).message)
                res.status(500).json({ error: 'Internal server error' })
            }
        }
    }
}

export default UtilityBiller