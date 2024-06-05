import { Server } from "ws";
import pool from "../../config/dbConfig";
import pools from "../../config/dbConfigPromise";
import UtilityRequestData from "../../model/UtilityModel/utility_request_data_model";
import UtilityStatusSelector from "../../model/UtilityModel/utility_verify_selector_model";
import WebSocketClass from "../../webSocket/websocket";
import VerifyPayment from "./utilityWSController";



const model = new UtilityStatusSelector(pool);
const urdata = new UtilityRequestData(pools);


function startInterval(server: any) {
    console.log("INIT INTERVAL")
  
    const verifyPaymentInstance = new VerifyPayment(model, urdata, server);
    const IntervalsInMilliseconds = 100 * 1000;
    setInterval(async() => {
        console.log("Interval callback called at startInterval", new Date());

        // Call verify method
        try {
           await verifyPaymentInstance.verify();
        } catch (error) {
            console.error("Error in interval:", error);
        }
    }, IntervalsInMilliseconds);
}


export { startInterval }