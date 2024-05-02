import axios, { AxiosError, isAxiosError } from "axios";
import { Request, Response } from "express";
import myCache from "../../../middleware/cache";



class CardByCountry{

    async cardsReq(req: Request, res: Response){
        const isoName = req.params

        console.log(isoName)
        try {
            const axiosInstance  =  axios.create()
            const CachedData = myCache.get("AUTH_GIFTCARD_KEY");
            const responseData: any = await axiosInstance.get(`https://giftcards-sandbox.reloadly.com/countries/${isoName.isoName}/products`,
                {
                    headers: {
                        'Authorization' : `Bearer ${CachedData}`
                    }
                }   
            )
            console.log("Begining", responseData)
            if(responseData){
                res.status(200).json({Success: true, message: responseData.data})
            }else {
                res.status(503).json({Success: false, message: "Response unsuccessful"})
            }
        } catch (error: any) {
            console.log(error.message)
            if(axios.isAxiosError(error)){
                const axiosError = error as AxiosError

                if(axiosError.request){
                    // console.log('Request was made but', axiosError.request)
                    res.status(503).json({Success: false, message: "Unable to make request"})
                }else if(axiosError.response){
                    // console.log('Request was made but', axiosError.response)
                    res.status(503).json({Success: false, messgae: "No response returned"})
                }else{
                    res.status(500).json({Success: false, message: "Internal server Error"})
                }
            }else{
                res.status(500).json({Success: false, message: "Internal server Error"})
            }
           
        }
    }
}

export default CardByCountry