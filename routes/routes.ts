import { Router } from "express";
import GetAuth from "../controller/getAuth";
import GetAirtime from "../controller/getAirtime";
import GetBalance from "../controller/getBalance";
import iosController from "./IOSroutes/IOSroutes";
import getSavedIosController from "./SavedIOSroutes/SavedIOSroutes";
import getSavedIosroute from "./SavedIOSroutes/SavedIOSroutes";

let router = Router();

router.post("/auth", GetAuth);
router.post("/airtime", GetAirtime);
router.get("/balance", GetBalance);

router.get("/ios", (req, res) => {
  iosController.getAllRecords(req, res);
});

router.get("/getios", (req, res) => {
  getSavedIosroute.getAllDbIosRecords(req, res)
});

export { router };
