// const axios = require('axios')
import { Request, Response } from 'express'
import axios, { AxiosError, AxiosResponse } from 'axios';
import myCache from '../helpers/cache'

async function GetAuth(req: Request, res: Response) {
    try {
        const CachedData = myCache.get("AUTH_DATA_KEY")
        const reqbody = req.body
        if(CachedData){
            console.log('Cached Data')
            res.json({ success: CachedData })
            return
        }
        const response: AxiosResponse = await axios.post('https://auth.reloadly.com/oauth/token', reqbody);
        const responseData = response.data
        console.log('returned', responseData.access_token)
        console.log('Before Cache', myCache.data)
        myCache.set("AUTH_DATA_KEY", responseData.access_token)
        console.log('After Cache', myCache.data)
        res.json({ success: responseData })
    } catch (error: any) {
        if (axios.isAxiosError(error)) {
            const axiosError = error as AxiosError
            if (axiosError.response) {
                console.log('Server responded with non-2xx status:', axiosError.response)
                res.status(axiosError.response.status).json({ axiosError: 'Server error' })
            } else if (axiosError.request) {
                console.log('No response from server')
                res.status(500).json({ axiosError: 'error code 500' })
            } else {
                console.log('Server error:', axiosError.message)
                res.status(500).json({ axiosError: 'Internal server error' })
            }
        } else {
            console.log('Server error:', (error as Error).message)
            res.status(500).json({ error: 'Internal server error' })
        }

    }
}

export default GetAuth