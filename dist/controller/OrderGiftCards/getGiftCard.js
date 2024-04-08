"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const axios_1 = __importDefault(require("axios"));
const cache_1 = __importDefault(require("../../middleware/cache"));
class OrderGiftCards {
    OrderGiftcardsProducts(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const endpoint = "https://giftcards-sandbox.reloadly.com/orders";
            const { customIdentifier, productId, quantity, recipientEmail, countryCode, phoneNumber, senderName, unitPrice, } = req.body;
            const data = {
                customIdentifier,
                productId,
                quantity,
                recipientEmail,
                countryCode,
                phoneNumber,
                senderName,
                unitPrice,
            };
            try {
                const AuthKEY = cache_1.default.get("AUTH_GIFTCARD_KEY");
                console.log("GGGG", AuthKEY);
                const response = yield axios_1.default.post(endpoint, data, {
                    headers: {
                        Authorization: `Bearer ${AuthKEY}`,
                        "Content-Type": "Application/json",
                    },
                });
                res.status(200).json({ success: response.data });
            }
            catch (error) {
                if (axios_1.default.isAxiosError(error)) {
                    const axiosError = error;
                    if (axiosError.response) {
                        console.log("Server response with a non-2xx status", axiosError.response);
                        res
                            .status(axiosError.response.status)
                            .json({ axiosError: "Server Error in generating Airtime" });
                    }
                    else if (axiosError.request) {
                        console.log("Server reequest Error ", axiosError.request.message);
                        res
                            .status(axiosError.request.status)
                            .json({ axiosError: "Server Error 500" });
                    }
                    else {
                        console.log("Server with status code 500", axiosError.message);
                        res.status(500).json({ axiosError: "Internal Server error" });
                    }
                }
                else {
                    console.log("Internal server error", error.message);
                    res.status(500).json({ error: "Internal server error" });
                }
            }
        });
    }
}
exports.default = OrderGiftCards;
