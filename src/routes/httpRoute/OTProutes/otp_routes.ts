import pool from "../../../config/dbConfig";
import OTPClass from "../../../controller/http/OTP/otp";
import OTPModel from "../../../model/OTPModel/otp_model";


const otpmodel = new OTPModel(pool)
const otpcontroller = new OTPClass(otpmodel)

export default otpcontroller