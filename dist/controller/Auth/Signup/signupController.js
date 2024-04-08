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
class SignUPController {
    constructor(model) {
        this.model = model;
    }
    createAccount(req, res) {
        var _a, _b;
        return __awaiter(this, void 0, void 0, function* () {
            const { first_name, last_name, email, country, phone_number, password, terms_n_condition } = req.body;
            const data = {
                first_name, last_name, email, country, phone_number, password, terms_n_condition
            };
            console.log(data);
            try {
                const checkInfo = yield this.model.checkUserModel(email, phone_number);
                console.log(checkInfo);
                if (checkInfo.length > 0) {
                    if (((_a = checkInfo[0]) === null || _a === void 0 ? void 0 : _a.phone_number) === phone_number && ((_b = checkInfo[0]) === null || _b === void 0 ? void 0 : _b.email.toLowerCase()) === email.toLowerCase()) {
                        res.status(409).json({ success: false, message: 'This Email address and Phone number are already registered' });
                    }
                    else if (checkInfo[0].phone_number === phone_number) {
                        res.status(409).json({ success: false, message: 'This Phone number Is Already Registered' });
                        console.log("hey");
                    }
                    else if (checkInfo[0].email.toLowerCase() === email.toLowerCase()) {
                        res.status(409).json({ success: false, message: 'This Email address Is Already Registered' });
                    }
                    else {
                        if (data.terms_n_condition === 1 && checkInfo[0].phone_number !== phone_number && checkInfo[0].email.toLowerCase() !== email.toLowerCase()) {
                            const modelRes = yield this.model.createUserModel(data);
                            console.log(modelRes);
                            res.status(200).json({ success: true, message: 'User account created successfully.' });
                        }
                    }
                }
                else {
                    const modelRes = yield this.model.createUserModel(data);
                    console.log(modelRes);
                    res.status(200).json({ success: true, message: 'User account created successfully.' });
                }
            }
            catch (error) {
                console.log(error);
                res.status(500).json({ success: false, message: 'Internal server error.' });
            }
        });
    }
    updateAvater(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { userAvater, email, password } = req.body;
            const data = {
                userAvater, email, password
            };
            try {
                const response = yield this.model.updateAvater(data);
                if (response.affectedRows == 1) {
                    const userData = yield this.model.userdata(data);
                    console.log(userData);
                    if (userData.length > 0) {
                        const condata = userData[0];
                        console.log(condata);
                        const secret = process.env.JWEB;
                        const token = jsonwebtoken_1.default.sign(condata, secret, { expiresIn: '1h' });
                        res.status(200).json({ success: true, message: "Avater Uploaded", data: token });
                    }
                }
                else {
                    res.status(424).json({ success: false, message: "Upload Unsuccessful" });
                }
            }
            catch (error) {
                console.log(error);
                res.status(500).json({ success: false, message: 'Internal server error.' });
            }
        });
    }
}
exports.default = SignUPController;
