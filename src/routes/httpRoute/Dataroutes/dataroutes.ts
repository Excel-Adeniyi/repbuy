import pool from "../../../config/dbConfig";
import GetDataController from "../../../controller/http/GetData/getData";
import PurchaseModel from "../../../model/GetAirtimeModel/get_airtime_Model";


const dataModel = new PurchaseModel(pool)
const datarequestController = new GetDataController(dataModel)

export default datarequestController