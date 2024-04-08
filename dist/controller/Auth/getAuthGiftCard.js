"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    Object.defineProperty(o, k2, { enumerable: true, get: function() { return m[k]; } });
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
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
const dotenv = __importStar(require("dotenv"));
dotenv.config();
function GetGiftCardAuth(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        let reqbody;
        reqbody = req.body;
        if (req.body !== undefined) {
            reqbody = req.body;
        }
        else {
            reqbody = {
                client_id: process.env.CLIENTID,
                client_secret: process.env.SECRET,
                grant_type: process.env.GRANTTYPE,
                audience: process.env.AUDIENCEG,
            };
        }
        try {
            const CachedData = cache_1.default.get("AUTH_GIFTCARD_KEY");
            if (CachedData) {
                // console.log("Cached Data", CachedData);
                if (res)
                    res.json({ success: CachedData });
                return;
            }
            const response = yield axios_1.default.post("https://auth.reloadly.com/oauth/token", reqbody);
            const responseData = response.data;
            cache_1.default.set("AUTH_GIFTCARD_KEY", responseData.access_token);
            res.json({ success: responseData });
        }
        catch (error) {
            if (axios_1.default.isAxiosError(error)) {
                const axiosError = error;
                if (axiosError.response) {
                    console.log(`Request failed with status code ${axiosError.response}`);
                    res
                        .status(axiosError.response.status)
                        .json({ axiosError: "Server Error" });
                }
                else if (axiosError.request) {
                    console.log("No response from server");
                    if (res)
                        res.status(500).json({ axiosError: "error code 500" });
                }
                else {
                    console.log("Server error:", axiosError.message);
                    if (res)
                        res.status(500).json({ axiosError: "Internal server error" });
                }
            }
        }
    });
}
const IntervalsInMilliseconds = 5 * 60 * 1000;
setInterval(() => __awaiter(void 0, void 0, void 0, function* () {
    console.log("Interval callback called at", new Date());
    // Call GetAuth function without passing req, res
    try {
        yield GetGiftCardAuth({}, {});
    }
    catch (error) {
        console.error("Error in interval:", error);
    }
}), IntervalsInMilliseconds);
exports.default = GetGiftCardAuth;
