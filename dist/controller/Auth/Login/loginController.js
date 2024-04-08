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
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const dotenv_1 = __importDefault(require("dotenv"));
dotenv_1.default.config();
class LoginController {
    constructor(model) {
        this.model = model;
    }
    loginAccount(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const data = req.body;
            console.log(data);
            const dataRs = data === null || data === void 0 ? void 0 : data.userdata;
            console.log(dataRs);
            const email = data.email;
            let resData = [];
            try {
                if (typeof dataRs === 'string' && /^\d+$/.test(dataRs)) {
                    console.log('HI', data.userdata);
                    const modelResult = yield this.model.loginMobileData(data);
                    if (modelResult.length > 0) {
                        const userData = {
                            id: modelResult[0].id,
                            first_name: modelResult[0].first_name,
                            last_mame: modelResult[0].last_name,
                            country: modelResult[0].country,
                            email: modelResult[0].email,
                            phone_number: modelResult[0].phone_number,
                            userpin: modelResult[0].userpin,
                            verified: modelResult[0].verified,
                            avatar: modelResult[0].avatar
                        };
                        console.log(userData);
                        const secret = process.env.JWEB;
                        const token = jsonwebtoken_1.default.sign(userData, secret, { expiresIn: '1h' });
                        // const results = await GetAuthTopUP(req, res)
                        resData.push({ success: true, message: token, payload: userData });
                    }
                    else {
                        resData.push({ success: false, message: "User with the mobile doesn't exit" });
                    }
                    res.status(200).json(resData);
                }
                else {
                    console.log('Invalid dataRs:', dataRs);
                    if (/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(dataRs)) {
                        const modelResult = yield this.model.loginData(data);
                        console.log(modelResult);
                        if (modelResult.length > 0) {
                            const userData = {
                                id: modelResult[0].id,
                                first_name: modelResult[0].first_name,
                                last_mame: modelResult[0].last_name,
                                country: modelResult[0].country,
                                email: modelResult[0].email,
                                phone_number: modelResult[0].phone_number,
                                userpin: modelResult[0].userpin,
                                verified: modelResult[0].verified,
                                avatar: modelResult[0].avatar
                            };
                            console.log(userData);
                            const secret = process.env.JWEB;
                            const token = jsonwebtoken_1.default.sign(userData, secret, { expiresIn: '1h' });
                            // const results = await GetAuthTopUP(req, res)
                            resData.push({ success: true, message: token, payload: userData });
                        }
                        else {
                            resData.push({ success: false, message: "User doesn't exit" });
                        }
                    }
                    else {
                        resData.push({ success: false, message: "Login details doesn't match requirement" });
                    }
                    res.status(200).json(resData);
                }
            }
            catch (error) {
                console.log(error);
                res.status(500).json("Internal Server Error");
            }
        });
    }
}
exports.default = LoginController;
