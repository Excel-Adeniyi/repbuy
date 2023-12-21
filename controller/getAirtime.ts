import { Request, Response, NextFunction } from 'express'
import axios, { AxiosError, AxiosResponse } from 'axios'
import myCache from '../helpers/cache'
async function GetAirtime(req: Request, res: Response, next: NextFunction) {
    try {
        let airtimeData = req.body

        const cachedD = myCache.get("AUTH_DATA_KEY");

        const response: AxiosResponse = await axios.post('https://topups-sandbox.reloadly.com/topups-async ', airtimeData,
            {
                headers: {
                    'Authorization': `Bearer ${cachedD}`,
                    'Content-Type': 'Application/json'
                }
            }
        )
        const responseData = response.data

        res.json(responseData)

    } catch (error: any) {
        if (axios.isAxiosError(error)) {
            const axiosError = error as AxiosError

            if (axiosError.response) {

                const responseData = axiosError.response.data as ({ message: string })
                console.log('Server response with a non-2xx status', responseData.message)
                res.status(axiosError.response.status).json({ axiosError: responseData.message })
            } else if (axiosError.request) {
                console.log('Server reequest Error ', axiosError.request)
                res.status(axiosError.request.status).json({ axiosError: 'Server Error 500' })
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

export default GetAirtime