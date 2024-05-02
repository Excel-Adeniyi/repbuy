import { Request, Response, NextFunction } from 'express'
import axios, { AxiosError, AxiosResponse } from 'axios'
import myCache from '../../../middleware/cache'

class OperatorClass {


    async GetOperators(req: Request, res: Response): Promise<void> {
        const cachedD: String | undefined = myCache.get("AUTH_DATA_KEY");
        console.log(cachedD)
        const stringAuth = JSON.stringify(cachedD)
        const axiosInstance = axios.create()
        axiosInstance.interceptors.request.use(function(config) {
            if (cachedD) {
                config.headers['Authorization'] = `Bearer ${cachedD}`;
            }
            config.headers["Content-Type"] = 'application/json';
            // console.log("Auth header:", config.headers['Authorization']);
            return config;
        }, function(error) {
            console.log(error);
            return Promise.reject(error);
        });
        
        try {
            let {phone, isoName} = req.body
           
            console.log({ phone, isoName })
           
    
            if (cachedD !== undefined) {
                console.log("HI")
    
                      const response: any = await  axiosInstance.get(`https://topups-sandbox.reloadly.com/operators/auto-detect/phone/${phone}/countries/${isoName}`
                )
                console.log("SOMETHING")
                const responseData = response.data
                console.log(response)
                res.json(responseData)
          
              
            }
        } catch (error: any) {
            console.log(error.message)
            if (axios.isAxiosError(error)) {
                const axiosError = error as AxiosError
    
                if (axiosError.response) {
    
                    const responseData = axiosError.response.data as ({ message: string })
                    console.log('Server response with a non-2xx status', responseData.message)
                    res.status(500).json({ axiosError: responseData })
                } else if (axiosError.request) {
                    console.log('Server reequest Error ', axiosError.request)
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
export default OperatorClass