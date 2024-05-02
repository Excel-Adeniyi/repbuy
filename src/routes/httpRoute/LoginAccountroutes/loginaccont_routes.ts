import pool from "../../../config/dbConfig";
import LoginController from "../../../controller/http/Auth/Login/loginController";
import LoginModel from "../../../model/AuthModel/loginModel";

const loginModel = new LoginModel(pool)
const loginController = new LoginController(loginModel)

export default loginController