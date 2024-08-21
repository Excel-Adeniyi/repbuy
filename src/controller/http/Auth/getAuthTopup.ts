// const axios = require('axios')
import { Request, Response } from "express";
import axios, { AxiosError, AxiosResponse } from "axios";
import myCache from "../../../middleware/cache";
import * as dotenv from "dotenv";
import isEmpty from "../../../helper/objectChecker";

dotenv.config();

async function GetAuthTopUP(req: Request, res: Response) {
  //console.log("Handling endpoint request at", new Date());

  try {
    const CachedData = myCache.get("AUTH_DATA_KEY");
    //console.log(CachedData)
    let reqbody;

    reqbody = {
      client_id: process.env.CLIENTID,
      client_secret: process.env.SECRET,
      grant_type: process.env.GRANTTYPE,
      audience: process.env.AUDIENCETS,
    };
    //console.log(reqbody)
    const cacheD: any = CachedData
    if (cacheD !== undefined) {
      res.status(200).json("successfully")
      return ({ success: myCache.data.AUTH_DATA_KEY.v });

    } else {
      const response: AxiosResponse = await axios.post(
        "https://auth.reloadly.com/oauth/token",
        reqbody
      );
      const responseData = response.data;
      //console.log("SS", responseData.access_token)
      myCache.set("AUTH_DATA_KEY", responseData.access_token);
      res.status(200).json("successfully")
      return ({ success: responseData.access_token });
    }
    
  } catch (error: any) {
    if (axios.isAxiosError(error)) {
      const axiosError = error as AxiosError;
      if (axiosError.response) {
        //console.log(
        //   "Server responded with non-2xx status:",
        //   axiosError.response
        // );
        if (res) res
          .status(500)
          .json({ axiosError: "Server error" });
      } else if (axiosError.request) {
        //console.log("No response from server");
        if (res) res.status(500).json({ axiosError: "error code 500" });
      } else {
        //console.log("Server error:", axiosError.message);
        if (res) res.status(500).json({ axiosError: "Internal server error" });
      }
    }
  }
}

const IntervalsInMilliseconds = 1800 * 1000;
setInterval(async () => {
  //console.log("Interval callback called at", new Date());

  // Call GetAuth function without passing req, res
  try {
    await GetAuthTopUP({} as Request, {} as Response);
  } catch (error) {
    console.error("Error in interval:", error);
  }
}, IntervalsInMilliseconds);
export default GetAuthTopUP;
