"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const getsavedIOS_1 = __importDefault(require("../../model/GetIOSCountryModel/getsavedIOS"));
const savedIOS_1 = __importDefault(require("../../controller/GETIOSCountry/savedIOS"));
const dbConfig_1 = __importDefault(require("../../config/dbConfig"));
const getSavedIosModel = new getsavedIOS_1.default(dbConfig_1.default);
const getSavedIosroute = new savedIOS_1.default(getSavedIosModel);
exports.default = getSavedIosroute;
