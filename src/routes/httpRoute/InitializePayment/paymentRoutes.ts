
import pool from "../../../config/dbConfig";
import PaymentController from "../../../controller/http/Payments/payments_controller";
import CurrentPurchaseModel from "../../../model/PaymentModel/current_purchase_select";

const paymentModel = new CurrentPurchaseModel(pool);
const paymentinit = new PaymentController(paymentModel)

export default paymentinit