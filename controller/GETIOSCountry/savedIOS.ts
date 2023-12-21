import { Request, Response } from "express";
import GETSavedIOSModel from "../../model/GetIOSCountryModel/getsavedIOS";

class GetSavedIOSController {
  private model: GETSavedIOSModel;

  constructor(model: GETSavedIOSModel) {
    this.model = model;
  }

  async getAllDbIosRecords(req: Request, res: Response): Promise<void> {
    try {
      const records = await this.model.getSavedIOSRecords();
        console.log()
      res.json(records);
    } catch (error) {
      console.log("Error from SavedIOSController", error);
      res.status(500).json({ error: "Internal Server Error" });
    }
  }
}

export default GetSavedIOSController;
