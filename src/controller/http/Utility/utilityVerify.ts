import axios from "axios";
import { Request, Response } from "express";
import myCache from "../../../middleware/cache";

class UtilityVerifier{

    async verify(req: Request, res: Response): Promise<void>{
        const {pid} = req.params
        const cacheDb = myCache.get('AUTH_UTILITY_KEY')
        try {
            const axiosInstance = axios.create()
            const responseVerify = await axiosInstance.get(`https://utilities-sandbox.reloadly.com/transactions/${pid}`, {
                headers: {
                    'Accept': 'application/com.reloadly.utilities-v1+json',
                    Authorization: `Bearer ${cacheDb}`
                }
            })
            //console.log('Checker', responseVerify.data)
        } catch (error: any) {
            //console.log(error.message)
        }
    }
}

export default UtilityVerifier