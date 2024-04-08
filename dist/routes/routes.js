"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.router = void 0;
const express_1 = require("express");
const getBalance_1 = __importDefault(require("../controller/getBalance"));
const IOSroutes_1 = __importDefault(require("./IOSroutes/IOSroutes"));
const SavedIOSroutes_1 = __importDefault(require("./SavedIOSroutes/SavedIOSroutes"));
const orderGiftCardroutes_1 = __importDefault(require("./OrderGiftCards/orderGiftCardroutes"));
const getAuthTopup_1 = __importDefault(require("../controller/Auth/getAuthTopup"));
const getAuthGiftCard_1 = __importDefault(require("../controller/Auth/getAuthGiftCard"));
const giftCardProducts_1 = __importDefault(require("./OrderGiftCards/giftCardProducts"));
const createAccount_1 = __importDefault(require("./CreateAcoountroutes/createAccount"));
const loginaccont_routes_1 = __importDefault(require("./LoginAccountroutes/loginaccont_routes"));
const verifyToken_1 = __importDefault(require("../middleware/verifyToken"));
const csrf_1 = __importDefault(require("../middleware/csrf"));
const operatorInfo_1 = __importDefault(require("../controller/Operator/operatorInfo"));
const Historyroutes_1 = __importDefault(require("./Historyroutes/Historyroutes"));
const get_airtime_routes_1 = __importDefault(require("./GetAirtimeroutes/get_airtime_routes"));
const getAuthUtility_1 = __importDefault(require("../controller/Auth/Utility/getAuthUtility"));
const getBiller_1 = __importDefault(require("../controller/Auth/Utility/getBiller"));
const google_routes_1 = __importDefault(require("./GoogleSignin/google_routes"));
const otp_routes_1 = __importDefault(require("./OTProutes/otp_routes"));
let router = (0, express_1.Router)();
exports.router = router;
router.post("/authtopup", getAuthTopup_1.default);
router.post('/authGiftCard', getAuthGiftCard_1.default);
router.post('/authUtility', getAuthUtility_1.default);
router.post("/airtime", (req, res) => get_airtime_routes_1.default.GetAirtime(req, res));
router.get('/utilitybiller', getBiller_1.default);
router.post("/otp", (req, res) => otp_routes_1.default.CreateHISTORYController(req, res));
router.post('/otpverify', (req, res) => otp_routes_1.default.recieveOTP(req, res));
router.post('/userpin', (req, res) => otp_routes_1.default.pincode(req, res));
router.post('/avater', (req, res) => createAccount_1.default.updateAvater(req, res));
router.get("/balance", verifyToken_1.default, getBalance_1.default);
router.get('/ctoken', csrf_1.default);
router.post('/create', (req, res) => createAccount_1.default.createAccount(req, res));
router.post('/login', (req, res) => loginaccont_routes_1.default.loginAccount(req, res));
router.post('/googleSignUp', (req, res) => google_routes_1.default.createAccount(req, res));
router.post('/operator', operatorInfo_1.default);
router.get("/ios", verifyToken_1.default, (req, res) => {
    IOSroutes_1.default.getAllRecords(req, res);
});
router.post("/history", (req, res) => Historyroutes_1.default.CreateHISTORYController(req, res));
router.get("/getios", (req, res) => {
    SavedIOSroutes_1.default.getAllDbIosRecords(req, res);
});
router.post("/orderGiftcard", verifyToken_1.default, (req, res) => {
    orderGiftCardroutes_1.default.OrderGiftcardsProducts(req, res);
});
router.get("/getGiftCardProducts", verifyToken_1.default, (req, res) => {
    giftCardProducts_1.default.GetAllGiftCardProducts(req, res);
});
