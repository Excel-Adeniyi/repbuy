import pool from "../../../config/dbConfig";
import GetAirtimeController from "../../controller/GetAirtime/getAirtime";
import AirtimeDataClass from "../../../model/GetAirtimeModel/get_airtime_Model";


const airtimeClassModel = new AirtimeDataClass(pool)
const airtimeController = new GetAirtimeController(airtimeClassModel)

export default airtimeController