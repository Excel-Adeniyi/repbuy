import pool from "../../config/dbConfig";
import GetAirtimeController from "../../controller/getAirtime";
import AirtimeDataClass from "../../model/GetAirtime/get_airtime_Model";


const airtimeClassModel = new AirtimeDataClass(pool)
const airtimeController = new GetAirtimeController(airtimeClassModel)

export default airtimeController