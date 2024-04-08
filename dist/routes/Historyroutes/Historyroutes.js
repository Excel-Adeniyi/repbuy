"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const dbConfig_1 = __importDefault(require("../../config/dbConfig"));
const historyContoller_1 = __importDefault(require("../../controller/history/historyContoller"));
const historyModel_1 = __importDefault(require("../../model/HistoryModel/historyModel"));
const otp_model_1 = __importDefault(require("../../model/OTPModel/otp_model"));
const user_details_1 = __importDefault(require("../../model/UserDetails/user_details"));
const historyModel = new historyModel_1.default(dbConfig_1.default);
const otpCheck = new otp_model_1.default(dbConfig_1.default);
const emailModel = new user_details_1.default(dbConfig_1.default);
const historyContoller = new historyContoller_1.default(historyModel, otpCheck, emailModel);
exports.default = historyContoller;
