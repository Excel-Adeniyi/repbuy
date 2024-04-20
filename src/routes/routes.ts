import { Router } from "express";

import GetAirtime from "../controller/GetAirtime/getAirtime";
import GetBalance from "../controller/getBalance";
import iosController from "./IOSroutes/IOSroutes";
import getSavedIosController from "./SavedIOSroutes/SavedIOSroutes";
import getSavedIosroute from "./SavedIOSroutes/SavedIOSroutes";
import OrderGiftCards from "../controller/OrderGiftCards/getGiftCard";
import orderGiftCards from "./OrderGiftCards/orderGiftCardroutes";
import GetAuthTopUp from "../controller/Auth/getAuthTopup";
import GetGiftCardAuth from "../controller/Auth/getAuthGiftCard";
import getallgiftcardProducts from "./OrderGiftCards/giftCardProducts";
import signUPController from "./CreateAcoountroutes/createAccount";
import loginController from "./LoginAccountroutes/loginaccont_routes";
import JToken from "../middleware/verifyToken";
import CsrfData from "../middleware/csrf";
import GetOperators from "../controller/Operator/operatorInfo";
import historyContoller from "./Historyroutes/Historyroutes";
import airtimeController from "./GetAirtimeroutes/get_airtime_routes";
import GetUntilityAuth from "../controller/Auth/Utility/getAuthUtility";
import UtilityBiller from "../controller/Auth/Utility/getBiller";
import googleSignInControlller from "./GoogleSignin/google_routes";
import otpcontroller from "./OTProutes/otp_routes";
import PaymentController from "../controller/Payments/payments_controller";
import paymentinit from "./InitializePayment/paymentRoutes";
import VerifyPaymnents from "../controller/Payments/payments_verify_controller";
import { verify } from "jsonwebtoken";
import verifypay from "./verifyPaymentsroutes/verifyPayroutes";
import operatorsclass from "./Operatorsroutes/operatorsroutes";


let router = Router();

router.post("/authtopup", GetAuthTopUp);
router.post('/authGiftCard', GetGiftCardAuth)
router.post('/authUtility', GetUntilityAuth)

//verify airtime OTP and Complete Payment
router.post('/otp/verify', (req, res) => airtimeController.VerifyOTP(req, res))
router.post("/airtime/request", (req, res) => airtimeController.GetAirtime(req, res));




router.get('/utilitybiller', UtilityBiller)


router.post("/otp", (req, res) => otpcontroller.CreateHISTORYController(req, res))
router.post('/otp/request', (req, res) => otpcontroller.recieveOTP(req, res))

router.post('/userpin', (req, res) => otpcontroller.pincode(req, res))

router.post('/avater', (req, res) => signUPController.updateAvater(req, res))

router.get("/balance", GetBalance);
router.get('/ctoken', CsrfData)

router.post('/create', (req, res) => signUPController.createAccount(req, res));
router.post('/login', (req, res) => loginController.loginAccount(req, res))
router.post('/googleSignUp', (req, res) => googleSignInControlller.createAccount(req, res))

router.post('/operator', (req, res) => operatorsclass.GetOperators(req, res))
router.get("/ios", JToken, (req, res) => {
  iosController.getAllRecords(req, res);
});

//Payment gateway:
router.post('/getreference',(req, res) => paymentinit.initializePayment(req, res))
router.post('/verifyPayment', (req, res) => verifypay.verifyPayment(req, res))


router.post("/history", (req, res) => historyContoller.CreateHISTORYController(req, res))
router.get("/getios", (req, res) => {
  getSavedIosroute.getAllDbIosRecords(req, res);
});
router.post("/orderGiftcard", JToken, (req, res) => {
  orderGiftCards.OrderGiftcardsProducts(req, res);
});

router.get("/getGiftCardProducts", JToken, (req, res) => {
  getallgiftcardProducts.GetAllGiftCardProducts(req, res)
})

export { router };
