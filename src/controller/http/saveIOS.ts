import { Request, Response, NextFunction } from "express";
import axios, { AxiosError, AxiosResponse } from "axios";
import myCache from "../../middleware/cache";
import IOSModel from "../../model/IOSModel";
import { parse } from "dotenv";
class IOSController {
  private model: IOSModel;

  constructor(model: IOSModel) {
    this.model = model;
  }

  async getAllRecords(req: Request, res: Response): Promise<void> {
    try {
      const authData = myCache.get("AUTH_DATA_KEY");
      console.log("UTH", authData);
      const response: AxiosResponse = await axios.get(
        "https://topups-sandbox.reloadly.com/countries",
        {
          headers: {
            Authorization: `Bearer ${authData}`,
            "Content-Type": "application/com.reloadly.topups-v1+json",
          },
        }
      );

      const resp = response.data;
      const Jd = JSON.stringify(resp);

      const records = await this.model.getIOSrecords(Jd);
      res.json(records);
    } catch (error) {
      console.error("Error fetching records", error);
      res.status(500).json({ error: "Internal Server Error" });
    }
  }
}

export default IOSController;
