import pool from "../../../config/dbConfig";
import PinCodeVerify from "../../../controller/http/Pincode/pincodeVerifier";
import Pincode from "../../../model/PincodeModel/pincode_model";



const pinmodel = new Pincode(pool)
const pincodeverifier = new PinCodeVerify(pinmodel)

export default pincodeverifier
