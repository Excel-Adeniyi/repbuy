"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const getGiftCard_1 = __importDefault(require("../../controller/OrderGiftCards/getGiftCard"));
const orderGiftCards = new getGiftCard_1.default();
exports.default = orderGiftCards;
