"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const dbConfig_1 = __importDefault(require("../../config/dbConfig"));
const otp_1 = __importDefault(require("../../controller/OTP/otp"));
const otp_model_1 = __importDefault(require("../../model/OTPModel/otp_model"));
const otpmodel = new otp_model_1.default(dbConfig_1.default);
const otpcontroller = new otp_1.default(otpmodel);
exports.default = otpcontroller;
