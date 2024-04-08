import { Request, Response, NextFunction } from 'express'
import axios, { AxiosError, AxiosResponse } from 'axios'
import myCache from '../../middleware/cache'
async function GetOperators(req: Request, res: Response, next: NextFunction) {
    try {
        let airtimeData = req.body
        console.log(airtimeData)
        const phone = airtimeData.phone
        const countryisocode = airtimeData.isoName
        console.log({phone, countryisocode})
        const cachedD = myCache.get("AUTH_DATA_KEY");
        console.log(cachedD)
        const response: AxiosResponse = await axios.get(`https://topups-sandbox.reloadly.com/operators/auto-detect/phone/${phone}/countries/${countryisocode}`,
            {
                headers: {
                    'Authorization': `Bearer ${cachedD}`,
                    'Content-Type': 'Application/json'
                }
            }
        )
        const responseData = response.data
        console.log(response)
        res.json(responseData)

    } catch (error: any) {
        if (axios.isAxiosError(error)) {
            const axiosError = error as AxiosError

            if (axiosError.response) {

                const responseData = axiosError.response.data as ({ message: string })
                console.log('Server response with a non-2xx status', responseData.message)
                res.status(500).json({ axiosError: responseData.message })
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

export default GetOperators