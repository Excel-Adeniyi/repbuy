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
const cache_1 = __importDefault(require("../../../middleware/cache"));
function UtilityBiller(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            let url = 'https://utilities-sandbox.reloadly.com/billers';
            const uAuth = cache_1.default.get("AUTH_UTILITY_KEY");
            console.log("uAuth", uAuth);
            const response = yield axios_1.default.get(url, {
                headers: {
                    "Authorization": `Bearer ${uAuth}`,
                    "Content-Type": "Application/json"
                }
            });
            const responseData = response.data;
            res.status(200).json(responseData);
        }
        catch (error) {
            if (axios_1.default.isAxiosError(error)) {
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
        }
    });
}
exports.default = UtilityBiller;
