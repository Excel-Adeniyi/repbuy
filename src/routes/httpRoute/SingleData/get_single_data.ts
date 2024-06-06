import pool from "../../../config/dbConfig";
import GetOnePurchasedItem from "../../../controller/http/SingleData/fetch_single_data";
import SinglePurchasedData from "../../../model/SingleData/single_data";
import UtilitySingleDataRequest from "../../../model/UtilityModel/utility_single_data_request";



const singleModel = new SinglePurchasedData(pool)
const model = new UtilitySingleDataRequest(pool)

const singleDataController = new GetOnePurchasedItem(model, singleModel)

export default singleDataController