"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const dbConfig_1 = __importDefault(require("../../config/dbConfig"));
const signupController_1 = __importDefault(require("../../controller/Auth/Signup/signupController"));
const signupModel_1 = __importDefault(require("../../model/Auth/signupModel"));
const signupModel = new signupModel_1.default(dbConfig_1.default);
const signUPController = new signupController_1.default(signupModel);
exports.default = signUPController;
