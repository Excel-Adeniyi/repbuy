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
class GoogleSignInController {
    constructor(model) {
        this.model = model;
    }
    createAccount(req, res) {
        var _a, _b, _c, _d;
        return __awaiter(this, void 0, void 0, function* () {
            const { first_name, email } = req.body;
            const data = {
                first_name, email
            };
            try {
                const checkInfo = yield this.model.checkGoogleModel(email);
                if (checkInfo[0].email.toLowerCase() === email.toLowerCase()) {
                    const userData = {
                        id: checkInfo[0].id,
                        first_name: checkInfo[0].first_name,
                        last_mame: (_a = checkInfo[0]) === null || _a === void 0 ? void 0 : _a.last_name,
                        country: (_b = checkInfo[0]) === null || _b === void 0 ? void 0 : _b.country,
                        email: (_c = checkInfo[0]) === null || _c === void 0 ? void 0 : _c.email,
                        phone_number: (_d = checkInfo[0]) === null || _d === void 0 ? void 0 : _d.phone_number
                    };
                    console.log(userData);
                    const secret = process.env.JWEB;
                    const token = jsonwebtoken_1.default.sign(userData, secret, { expiresIn: '1h' });
                    res.status(200).json({ success: false, message: token });
                }
                else {
                    if (checkInfo[0].email.toLowerCase() !== email.toLowerCase()) {
                        const modelRes = yield this.model.GoogleSignInModel(data);
                        console.log(modelRes);
                        const userData = {
                            id: checkInfo[0].id,
                            first_name: checkInfo[0].first_name,
                            last_mame: checkInfo[0].last_name,
                            country: checkInfo[0].country,
                            email: checkInfo[0].email,
                            phone_number: checkInfo[0].phone_number
                        };
                        console.log(userData);
                        const secret = process.env.JWEB;
                        const token = jsonwebtoken_1.default.sign(userData, secret, { expiresIn: '1h' });
                        res.status(200).json({ success: false, message: token });
                    }
                }
            }
            catch (error) {
                console.log(error);
                res.status(500).json({ success: false, message: 'Internal server error.' });
            }
        });
    }
}
exports.default = GoogleSignInController;
