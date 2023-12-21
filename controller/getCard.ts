import { Request, Response } from "express";
import axios, {AxiosError, AxiosResponse} from "axios";
import myCache from "../helpers/cache";

async function GetCard(req:Request, res: Response) {
    try {
        const cachedData = myCache.get("AUTH_DATA_KEY")
        const reqbody = req.body
        if(cachedData){
            console.log('Cached Data')
            res.json({success: cachedData})
            return
        }
    } catch (error) {
        
    }
}