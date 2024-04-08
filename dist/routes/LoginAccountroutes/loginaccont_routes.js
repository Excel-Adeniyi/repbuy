"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const dbConfig_1 = __importDefault(require("../../config/dbConfig"));
const loginController_1 = __importDefault(require("../../controller/Auth/Login/loginController"));
const loginModel_1 = __importDefault(require("../../model/Auth/loginModel"));
const loginModel = new loginModel_1.default(dbConfig_1.default);
const loginController = new loginController_1.default(loginModel);
exports.default = loginController;
