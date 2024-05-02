import pool from "../../../config/dbConfig";
import GoogleSignInController from "../../../controller/http/Auth/Login/googleSignIn";
import SignupModel from "../../../model/AuthModel/signupModel";


const googleSign = new SignupModel(pool)
const googleSignInControlller = new GoogleSignInController(googleSign)

export default googleSignInControlller