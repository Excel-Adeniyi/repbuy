"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const dbConfig_1 = __importDefault(require("../../config/dbConfig"));
const getAirtime_1 = __importDefault(require("../../controller/getAirtime"));
const get_airtime_Model_1 = __importDefault(require("../../model/GetAirtime/get_airtime_Model"));
const airtimeClassModel = new get_airtime_Model_1.default(dbConfig_1.default);
const airtimeController = new getAirtime_1.default(airtimeClassModel);
exports.default = airtimeController;
