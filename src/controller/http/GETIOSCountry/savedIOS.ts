import { Request, Response } from "express";
import GETSavedIOSModel from "../../../model/GetIOSCountryModel/getsavedIOS";

class GetSavedIOSController {
  private model: GETSavedIOSModel;

  constructor(model: GETSavedIOSModel) {
    this.model = model;
  }

  async getAllDbIosRecords(req: Request, res: Response): Promise<void> {
    try {
      const records: any = await this.model.getSavedIOSRecords();
      if (records.length !== 0){
        const jsonRecord = JSON.parse(records[0].extras)
        console.log()
      res.json({success: true, message: jsonRecord});
      }else{
        res.json({success: true, message: "Error Fetching Data"});
      }
    } catch (error) {
      console.log("Error from SavedIOSController", error);
      res.status(500).json({ error: "Internal Server Error" });
    }
  }
}

export default GetSavedIOSController
