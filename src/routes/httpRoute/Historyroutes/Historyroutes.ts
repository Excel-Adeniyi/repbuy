import pool from "../../../config/dbConfig";
import HistoryClass from "../../../controller/http/Purchase/purchaseContoller";
import HistoryModel from "../../../model/HistoryModel/historyModel";
import OTPModel from "../../../model/OTPModel/otp_model";
import User_detailsMODEL from "../../../model/UserDetailsModel/user_details";



const historyModel = new HistoryModel(pool)
const otpCheck = new OTPModel(pool)
const emailModel = new User_detailsMODEL(pool)
const historyContoller = new HistoryClass(historyModel, otpCheck, emailModel)

export default historyContoller