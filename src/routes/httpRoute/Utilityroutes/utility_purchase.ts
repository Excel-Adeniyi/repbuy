import pool from "../../../config/dbConfig";
import UtilityPurchaseController from "../../../controller/http/Auth/Utility/utility__purchase_store";
import UtilityPurchase from "../../../model/UtilityModel/utility_purchase_model";


const utilityModel = new UtilityPurchase(pool) 
const utilityPurchase = new UtilityPurchaseController(utilityModel)

export default utilityPurchase