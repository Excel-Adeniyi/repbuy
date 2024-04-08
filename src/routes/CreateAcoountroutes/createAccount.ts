import pool from "../../config/dbConfig";
import SignUPController from "../../controller/Auth/Signup/signupController";
import SignupModel from "../../model/Auth/signupModel";

const signupModel = new SignupModel(pool)
const signUPController = new SignUPController(signupModel)

export default signUPController