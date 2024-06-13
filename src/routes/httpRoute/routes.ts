import { Router } from "express";

import GetAirtime from "../../controller/http/GetAirtime/getAirtime";
import GetBalance from "../../controller/http/balance/getBalance";
import iosController from "./IOSroutes/IOSroutes";
import getSavedIosController from "./SavedIOSroutes/SavedIOSroutes";
import getSavedIosroute from "./SavedIOSroutes/SavedIOSroutes";
import OrderGiftCards from "../../controller/http/OrderGiftCards/getGiftCard";
import orderGiftCards from "./OrderGiftCards/orderGiftCardroutes";
import GetAuthTopUp from "../../controller/http/Auth/getAuthTopup";
import GetGiftCardAuth from "../../controller/http/Auth/getAuthGiftCard";
import getallgiftcardProducts from "./OrderGiftCards/giftCardProducts";
import signUPController from "./CreateAcoountroutes/createAccount";
import loginController from "./LoginAccountroutes/loginaccont_routes";
import JToken from "../../middleware/verifyToken";
import CsrfData from "../../middleware/csrf";
import GetOperators from "../../controller/http/Operator/operatorInfo";
import historyContoller from "./Historyroutes/Historyroutes";
import airtimeController from "./GetAirtimeroutes/get_airtime_routes";
import GetUntilityAuth from "../../controller/http/Utility/getAuthUtility";
import UtilityBiller from "../../controller/http/Utility/getBiller";
import googleSignInControlller from "./GoogleSignin/google_routes";
import otpcontroller from "./OTProutes/otp_routes";
import PaymentController from "../../controller/http/Payments/payments_controller";
import paymentinit from "./InitializePayment/paymentRoutes";
import VerifyPaymnents from "../../controller/http/Payments/payments_verify_controller";
import { verify } from "jsonwebtoken";
import verifypay from "./verifyPaymentsroutes/verifyPayroutes";
import operatorsclass from "./Operatorsroutes/operatorsroutes";
import pincodeverifier from "./Pincode/pincode_route";
import datarequestController from "./Dataroutes/dataroutes";
import UtilityPayment from "../../controller/http/Utility/utilityPayment";
import utilityPayment from "./Utilityroutes/utility_route";
import utilityVerify from "./Utilityroutes/utility_verify";
import utilityPurchase from "./Utilityroutes/utility_purchase";
import getCardsController from "./OrderGiftCards/getcards_by_iso_name_routes";
import VerifyXTOKEN from "../../middleware/v_csrf";
import getGiftcardById from "./OrderGiftCards/giftcards_by_id_routes";
import giftcardProcessOrder from "./OrderGiftCards/giftcard_process_order";
import creatededicatedAccount from "./CreateDedicatedAccountroutes/create_dedicated_account";
import fcmStorageController from "./FCMStorageroutes/FCMStorageroutes";
import singleDataController from "./SingleData/get_single_data";
import translistcontroller from "./TransactionList/transaction_list_routes";
import giftcardpurchasebeforePayment from "./OrderGiftCards/giftcard_purchase_first_save_to_db";


let router = Router();

router.post("/authtopup", GetAuthTopUp);
router.post('/authUtility', GetUntilityAuth)
//verify airtime OTP and Complete Payment
router.post('/otp/verify', (req, res) => airtimeController.VerifyOTP(req, res))
router.post("/airtime/request", (req, res) => airtimeController.GetAirtime(req, res));
//Data service
router.post('/data/request', (req, res) => datarequestController.GetData(req, res))
router.get("/balance", GetBalance);
router.post('/ctoken', CsrfData)
router.post('/operator', (req, res) => operatorsclass.GetOperators(req, res))
router.get("/ios", JToken, (req, res) => {
  iosController.getAllRecords(req, res);
});
router.post("/history", (req, res) => historyContoller.CreatePurchaseController(req, res))
router.get("/getios", (req, res) => {
  getSavedIosroute.getAllDbIosRecords(req, res);
});
//Paystack fundings
router.post("/create/dedicated/account/paystack", (req, res) => {
  creatededicatedAccount.CreateDedicatedAccount(req, res)
})
// #################### Login and create account ##############
router.post('/create', (req, res) => signUPController.createAccount(req, res));
router.post('/login', (req, res) => loginController.loginAccount(req, res))
router.post('/googleSignUp', (req, res) => googleSignInControlller.createAccount(req, res))
router.post('/userpin', (req, res) => otpcontroller.pincode(req, res))
router.post('/userpin/verify', (req, res) => pincodeverifier.initiateVerify(req, res))
router.post('/avater', (req, res) => signUPController.updateAvater(req, res))


//##################### GIFT CARD #################
router.post('/authGiftCard', GetGiftCardAuth)
//get card by country
router.get('/giftcard/getcards/:isoName', (req, res) => getCardsController.cardsReq(req, res))
//get card by id
router.get('/giftcard/getcard/:id', (req, res) => getGiftcardById.cardsReq(req, res))
//giftcard Payment Purchase through Paystack
router.post('/giftcard/order', (req, res) => giftcardProcessOrder.processPayment(req, res))
router.post("/orderGiftcard", JToken, (req, res) => {
  orderGiftCards.OrderGiftcardsProducts(req, res);
});
router.get("/getGiftCardProducts", JToken, (req, res) => {
  getallgiftcardProducts.GetAllGiftCardProducts(req, res)
})
router.post('/giftcard/save/bpayment', (req,res) => giftcardpurchasebeforePayment.cardPurchase(req, res))



//################ UTILITY ##############\
//Utility service
router.post('/utility/payment', (req, res) => utilityPayment.ubiller(req, res))
//Utility verify
router.get('/utility/verify/:pid', (req, res) => utilityVerify.verify(req, res))
//Save Utility Purchase in the db
router.post('/utility/purchase/data', (req, res) => utilityPurchase.utilitypurchasecontroller(req, res))
router.get('/utilitybiller', UtilityBiller)


//############# Payment gateway: ###########
router.post('/getreference', (req, res) => paymentinit.initializePayment(req, res))
router.post('/verifyPayment', (req, res) => verifypay.verifyPayment(req, res))


//############ Get Single Purchased Data ###############
router.get("/purchase/data/:type/:ntransactionId/:userId", (req, res)=> {
  singleDataController.provideSingleData(req, res)
})
router.get('/purchase/list/:userId', (req, res) => {
  translistcontroller.getlist(req, res)
})

//############# OTP ####################
router.post("/otp", (req, res) => otpcontroller.CreateHISTORYController(req, res))
router.post('/otp/request', (req, res) => otpcontroller.recieveOTP(req, res))

//########## Storage for Firbase Cloud Messaging ########
router.post("/store/token", (req, res) => {
  fcmStorageController.fcmstorer(req, res)
})

//##########
export { router };
