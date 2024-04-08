import pool from "../../config/dbConfig";
import GoogleSignInController from "../../controller/Auth/Login/googleSignIn";
import SignupModel from "../../model/Auth/signupModel";


const googleSign = new SignupModel(pool)
const googleSignInControlller = new GoogleSignInController(googleSign)

export default googleSignInControlller