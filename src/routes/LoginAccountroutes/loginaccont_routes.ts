import pool from "../../config/dbConfig";
import LoginController from "../../controller/Auth/Login/loginController";
import LoginModel from "../../model/Auth/loginModel";

const loginModel = new LoginModel(pool)
const loginController = new LoginController(loginModel)

export default loginController