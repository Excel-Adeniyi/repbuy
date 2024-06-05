import pool from "../../../config/dbConfig";
import UtilityBiller from "../../../controller/http/Utility/getBiller";
import UtilityPayment from "../../../controller/http/Utility/utilityPayment";
import UtilityTransactionSaver from "../../../model/UtilityModel/utility_transaction_saver";


const utilityPaymentModel = new UtilityTransactionSaver(pool)
const utilityPayment = new UtilityPayment(utilityPaymentModel)
export default utilityPayment