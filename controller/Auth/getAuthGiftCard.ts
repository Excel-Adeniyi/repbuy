import { Request, Response } from "express";
import axios, { AxiosError, AxiosResponse } from "axios";
import myCache from "../../helpers/cache";
import * as dotenv from "dotenv";
dotenv.config();

async function GetGiftCardAuth(req: Request, res: Response) {
  let reqbody;
  reqbody = req.body;
  if (req.body !== undefined) {
    reqbody = req.body;
  } else {
    reqbody = {
      client_id: process.env.CLIENTID,
      client_secret: process.env.SECRET,
      grant_type: process.env.GRANTTYPE,
      audience: process.env.AUDIENCE,
    };
  }
  try {
    const CachedData = myCache.get("AUTH_GIFTCARD_KEY");
    if (CachedData) {
        console.log("Cached Data", CachedData);
        if (res) res.json({ success: CachedData });
        return
      }
    const response: AxiosResponse = await axios.post(
      "https://auth.reloadly.com/oauth/token",
      reqbody
    );
    const responseData = response.data;
    myCache.set("AUTH_GIFTCARD_KEY", responseData.access_token);
    res.json({ success: responseData });
  } catch (error) {
    if (axios.isAxiosError(error)) {
      const axiosError = error as AxiosError;
      if (axiosError.response) {
        console.log(`Request failed with status code ${axiosError.response}`);
        res
          .status(axiosError.response.status)
          .json({ axiosError: "Server Error" });
      } else if (axiosError.request) {
        console.log("No response from server");
        if (res) res.status(500).json({ axiosError: "error code 500" });
      } else {
        console.log("Server error:", axiosError.message);
        if (res) res.status(500).json({ axiosError: "Internal server error" });
      }
    }
  }
}

const IntervalsInMilliseconds = 5*60*1000;
setInterval(async () => {
  console.log("Interval callback called at", new Date());

  // Call GetAuth function without passing req, res
  try {
    await GetGiftCardAuth({} as Request, {} as Response);
  } catch (error) {
    console.error("Error in interval:", error);
  }
}, IntervalsInMilliseconds);

export default GetGiftCardAuth