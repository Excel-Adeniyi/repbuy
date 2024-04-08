
import pool from "../../config/dbConfig";
import PaymentController from "../../controller/Payments/payments_controller";
import CurrentPurchaseModel from "../../model/Payment/current_purchase_select";

const paymentModel = new CurrentPurchaseModel(pool);
const paymentinit = new PaymentController(paymentModel)

export default paymentinit