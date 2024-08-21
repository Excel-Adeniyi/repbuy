import { Request, Response, NextFunction } from "express";
import axios, { AxiosError, AxiosResponse } from "axios";
import myCache from "../../../middleware/cache";
async function GetBalance(req: Request, res: Response, next: NextFunction) {
  try {
    const { auth } = req.body;
    const authData = myCache.get("AUTH_DATA_KEY");

    const response: AxiosResponse = await axios.get(
      "https://topups-sandbox.reloadly.com/accounts/balance",
      {
        headers: {
          Authorization: `Bearer ${authData}`,
          "Content-Type": "application/com.reloadly.topups-v1+json",
        },
      }
    );
    const responseData = response.data;

    res.json(responseData);
  } catch (error: any) {
    if (axios.isAxiosError(error)) {
      const axiosError = error as AxiosError;

      if (axiosError.response) {
        //console.log(
          // "Server response with a non-2xx status",
        //   axiosError.response
        // );
        res
          .status(axiosError.response.status)
          .json({ axiosError: "Server Error in generating Airtime" });
      } else if (axiosError.request) {
        //console.log("Server reequest Error ", axiosError.request);
        res
          .status(axiosError.request.status)
          .json({ axiosError: "Server Error 500" });
      } else {
        //console.log("Server with status code 500", axiosError.message);
        res.status(500).json({ axiosError: "Internal Server error" });
      }
    } else {
      //console.log("Internal server error", (error as Error).message);
      res.status(500).json({ error: "Internal server error" });
    }
  }
}

export default GetBalance;
