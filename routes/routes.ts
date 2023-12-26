import { Router } from "express";

import GetAirtime from "../controller/getAirtime";
import GetBalance from "../controller/getBalance";
import iosController from "./IOSroutes/IOSroutes";
import getSavedIosController from "./SavedIOSroutes/SavedIOSroutes";
import getSavedIosroute from "./SavedIOSroutes/SavedIOSroutes";
import OrderGiftCards from "../controller/OrderGiftCards/getGiftCard";
import orderGiftCards from "./OrderGiftCards/orderGiftCardroutes";
import GetAuthTopUp from "../controller/Auth/getAuthTopup";
import GetGiftCardAuth from "../controller/Auth/getAuthGiftCard";
import getallgiftcardProducts from "./OrderGiftCards/giftCardProducts";

let router = Router();

router.post("/authtopup", GetAuthTopUp);
router.post('/authGiftCard', GetGiftCardAuth)
router.post("/airtime", GetAirtime);
router.get("/balance", GetBalance);

router.get("/ios", (req, res) => {
  iosController.getAllRecords(req, res);
});

router.get("/getios", (req, res) => {
  getSavedIosroute.getAllDbIosRecords(req, res);
});
router.post("/orderGiftcard", (req, res) => {
  orderGiftCards.OrderGiftcardsProducts(req, res);
});

router.get("/getGiftCardProducts", (req, res) => {
  getallgiftcardProducts.GetAllGiftCardProducts(req, res)
})
export { router };
