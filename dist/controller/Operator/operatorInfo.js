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
function GetOperators(req, res, next) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            let airtimeData = req.body;
            console.log(airtimeData);
            const phone = airtimeData.phone;
            const countryisocode = airtimeData.isoName;
            console.log({ phone, countryisocode });
            const cachedD = cache_1.default.get("AUTH_DATA_KEY");
            console.log(cachedD);
            const response = yield axios_1.default.get(`https://topups-sandbox.reloadly.com/operators/auto-detect/phone/${phone}/countries/${countryisocode}`, {
                headers: {
                    'Authorization': `Bearer ${cachedD}`,
                    'Content-Type': 'Application/json'
                }
            });
            const responseData = response.data;
            console.log(response);
            res.json(responseData);
        }
        catch (error) {
            if (axios_1.default.isAxiosError(error)) {
                const axiosError = error;
                if (axiosError.response) {
                    const responseData = axiosError.response.data;
                    console.log('Server response with a non-2xx status', responseData.message);
                    res.status(500).json({ axiosError: responseData.message });
                }
                else if (axiosError.request) {
                    console.log('Server reequest Error ', axiosError.request);
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
exports.default = GetOperators;
