import { Request, Response, NextFunction } from 'express'
import axios, { AxiosError, AxiosResponse } from 'axios'
import myCache from '../../middleware/cache'

class OperatorClass {


    async GetOperators(req: Request, res: Response): Promise<void> {

        axios.interceptors.request.use((config) => {

            config.headers["Content-Type"] = 'application/json';
            config.headers.Accept = 'application/com.reloadly.topups-v1+json'
            config.headers['Authorization'] = `Bearer ${myCache.get("AUTH_DATA_KEY")}`;
            console.log("AUthrot", config)
            return config
        })
        try {
            let {phone, isoName} = req.body
           
            console.log({ phone, isoName })
            const cachedD: String | undefined = myCache.get("AUTH_DATA_KEY");
            console.log(cachedD)

            if (cachedD !== undefined) {
                console.log("HI")

                      const response: any = await  axios.get(`https://topups-sandbox.reloadly.com/operators/auto-detect/phone/08161722995/countries/${isoName}`
                    // {
                    //     headers: {
                    //         "Accept": 'application/com.reloadly.topups-v1+json',
                    //         "Content-Type": 'application/json',
                    //         "Authorization": `Bearer ${cachedD || 'eyJraWQiOiI1N2JjZjNhNy01YmYwLTQ1M2QtODQ0Mi03ODhlMTA4OWI3MDIiLCJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMTY4MiIsImlzcyI6Imh0dHBzOi8vcmVsb2FkbHktc2FuZGJveC5hdXRoMC5jb20vIiwiaHR0cHM6Ly9yZWxvYWRseS5jb20vc2FuZGJveCI6dHJ1ZSwiaHR0cHM6Ly9yZWxvYWRseS5jb20vcHJlcGFpZFVzZXJJZCI6IjIxNjgyIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIiwiYXVkIjoiaHR0cHM6Ly90b3B1cHMtaHMyNTYtc2FuZGJveC5yZWxvYWRseS5jb20iLCJuYmYiOjE3MTI3NTMyODMsImF6cCI6IjIxNjgyIiwic2NvcGUiOiJzZW5kLXRvcHVwcyByZWFkLW9wZXJhdG9ycyByZWFkLXByb21vdGlvbnMgcmVhZC10b3B1cHMtaGlzdG9yeSByZWFkLXByZXBhaWQtYmFsYW5jZSByZWFkLXByZXBhaWQtY29tbWlzc2lvbnMiLCJleHAiOjE3MTI4Mzk2ODMsImh0dHBzOi8vcmVsb2FkbHkuY29tL2p0aSI6ImRhMDc5ZWY4LWNiMWUtNGYyMS1iOTM0LTFmYzY1YjQ2ZGUwYyIsImlhdCI6MTcxMjc1MzI4MywianRpIjoiMjYwMzQ5YmEtMDk0Mi00MGZiLTlhYzgtMjk5YjUwZTRmZmQ1In0.hZNIYH01146YCO2sJ0x3tpeLTpQG6rUvVMicN5Tbads' }`,
                    //     },
                    // }
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