import { Request, Response } from "express";
import { ValueDigit } from "../../../helper/randomDigit";
import nodemailer from 'nodemailer'
import OTPModel from "../../../model/OTPModel/otp_model";
import HistoryModel from "../../../model/HistoryModel/historyModel";
import User_detailsMODEL from "../../../model/UserDetailsModel/user_details";

class HistoryClass {
  private otpModel: OTPModel;
  private model: HistoryModel;
  private emailModel: User_detailsMODEL
  // Define a private property for OTPModel

  constructor(model: HistoryModel, otpModel: OTPModel, emailModel: User_detailsMODEL) {
    this.model = model;
    this.otpModel = otpModel; // Initialize the OTPModel
    this.emailModel = emailModel
  }

  async CreatePurchaseController(req: Request, res: Response): Promise<void> {

    try {
      const { operatorId, amount, recipientPhone, userId, order, provider, purchase_type } = req.body
      const timeData = new Date()
      const data = {
        operatorId, amount, countryCode: recipientPhone.countryCode, number: recipientPhone.number, timeData, userId, purchase_type
      }
      //console.log({ operatorId, amount, recipientPhone, userId, order, provider })
      const modelResult: any = await this.model.Create_Current_Purchase_Model(data)
      if (modelResult.affectedRow === 1) {
        res.status(200).json({ Success: true, message: "Purchase data Initiated" })
      } else {
        res.status(503).json({ Success: 503, message: "Purchase data not Initiated" })
      }

    } catch (error) {
      //console.log(error)
      res.status(500).json("Internal Server Error")
    }

  }

}
export default HistoryClass;