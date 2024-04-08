"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const IOSModel_1 = __importDefault(require("../../model/IOSModel"));
const saveIOS_1 = __importDefault(require("../../controller/saveIOS"));
const dbConfig_1 = __importDefault(require("../../config/dbConfig"));
const iosModel = new IOSModel_1.default(dbConfig_1.default);
const iosController = new saveIOS_1.default(iosModel);
exports.default = iosController;
