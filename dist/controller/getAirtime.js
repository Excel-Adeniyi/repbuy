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
const cache_1 = __importDefault(require("../middleware/cache"));
class GetAirtimeController {
    constructor(model) {
        this.model = model;
    }
    GetAirtime(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                let airtimeData = req.body;
                console.log(airtimeData);
                const dataOTP = {
                    otp: airtimeData.otp,
                    userId: airtimeData.userId
                };
                const modelResult = yield this.model.CHECKOTP(dataOTP);
                console.log(modelResult);
                if (modelResult !== null && modelResult !== undefined && modelResult.length > 0) {
                    const otpTime = modelResult[0].time;
                    // console.log(otpTime)
                    const currentTime = new Date().getTime();
                    const toUpdatedTime = new Date(otpTime.getTime() + (1 * 60 * 60 * 1000));
                    const otpDate = otpTime.toLocaleDateString();
                    const currentDate = new Date().toLocaleDateString();
                    const verifyTime = new Date(toUpdatedTime.getTime() + (15 * 60 * 1000));
                    const correctedTime = verifyTime.getTime();
                    if (otpDate === currentDate) {
                        console.log("BIG", { currentTime, correctedTime });
                        if (currentTime < correctedTime) {
                            console.log("US");
                            const dataReq = {
                                operatorId: airtimeData.operatorId,
                                amount: airtimeData.amount,
                                recipientPhone: { countryCode: airtimeData.recipientPhone.countryCode, number: airtimeData.recipientPhone.number }
                            };
                            const cachedD = cache_1.default.get("AUTH_DATA_KEY");
                            const response = yield axios_1.default.post('https://topups-sandbox.reloadly.com/topups-async ', dataReq, {
                                headers: {
                                    'Authorization': `Bearer ${cachedD}`,
                                    'Content-Type': 'Application/json'
                                }
                            });
                            const responseData = response.data;
                            console.log(responseData);
                            if (responseData.transactionId != undefined && responseData.transactionId != null) {
                                const data = {
                                    transactionId: responseData.transactionId,
                                    userId: airtimeData.userId
                                };
                                const updatePurchaseTable = yield this.model.GetAirtimeModel(data);
                                // console.log(updatePurchaseTable)
                                if (updatePurchaseTable !== undefined && updatePurchaseTable !== null) {
                                    res.json(responseData);
                                }
                            }
                        }
                        else {
                            res.status(500).json("OTP Timed out");
                        }
                    }
                    else {
                        console.log("US");
                        const dataReq = {
                            operatorId: airtimeData.operatorId,
                            amount: airtimeData.amount,
                            recipientPhone: { countryCode: airtimeData.recipientPhone.countryCode, number: airtimeData.recipientPhone.number }
                        };
                        const cachedD = cache_1.default.get("AUTH_DATA_KEY");
                        const response = yield axios_1.default.post('https://topups-sandbox.reloadly.com/topups-async ', dataReq, {
                            headers: {
                                'Authorization': `Bearer ${cachedD}`,
                                'Content-Type': 'Application/json'
                            }
                        });
                        const responseData = response.data;
                        console.log(responseData);
                        if (responseData.transactionId != undefined && responseData.transactionId != null) {
                            const data = {
                                transactionId: responseData.transactionId,
                                userId: airtimeData.userId
                            };
                            const updatePurchaseTable = yield this.model.GetAirtimeModel(data);
                            // console.log(updatePurchaseTable)
                            if (updatePurchaseTable !== undefined && updatePurchaseTable !== null) {
                                res.json(responseData);
                            }
                        }
                    }
                }
                else {
                    res.status(500).json("Invalid OTP");
                }
            }
            catch (error) {
                // console.log(error)
                if (axios_1.default.isAxiosError(error)) {
                    const axiosError = error;
                    if (axiosError.response) {
                        const responseData = axiosError.response.data;
                        console.log('Server response with a non-2xx status', responseData.message);
                        res.status(500).json({ axiosError: responseData.message });
                    }
                    else if (axiosError.request) {
                        // console.log('Server reequest Error ', axiosError.request)
                        res.status(500).json({ axiosError: 'Server Error 500' });
                    }
                    else {
                        console.log('Server with status code 500', axiosError.message);
                        res.status(500).json({ axiosError: 'Internal Server error' });
                    }
                }
                else {
                    console.log('Internal server error', error.message);
                    res.status(500).json({ error: 'Internal server error' });
                }
            }
        });
    }
}
exports.default = GetAirtimeController;
