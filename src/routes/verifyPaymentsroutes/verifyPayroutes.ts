import { Pool } from "mysql2/typings/mysql/lib/Pool";
import VerifyPaymnents from "../../controller/Payments/payments_verify_controller";
import CurrentPurchaseModel from "../../model/Payment/current_purchase_select";
import pool from "../../config/dbConfig";

const updatePaymentSuccess = new CurrentPurchaseModel(pool)
const verifypay = new VerifyPaymnents(updatePaymentSuccess);

export default verifypay