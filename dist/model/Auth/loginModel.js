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
Object.defineProperty(exports, "__esModule", { value: true });
class LoginModel {
    constructor(pool) {
        this.pool = pool;
    }
    loginData(data) {
        return __awaiter(this, void 0, void 0, function* () {
            const query = "SELECT * FROM user_account WHERE email = ? AND password = ?";
            const dataN = {
                email: data.userdata,
                password: data.password
            };
            console.log(dataN);
            return new Promise((resolve, reject) => {
                this.pool.query(query, [...Object.values(dataN)], (error, results) => {
                    if (error) {
                        reject(error);
                    }
                    else {
                        resolve(results);
                    }
                });
            });
        });
    }
    loginMobileData(data) {
        return __awaiter(this, void 0, void 0, function* () {
            const query = "SELECT * FROM user_account WHERE phone_number = ? AND password = ?";
            console.log(data);
            const dataN = {
                phone_number: data.userdata,
                password: data.password
            };
            //    console.log(dataN)
            return new Promise((resolve, reject) => {
                this.pool.query(query, [...Object.values(dataN)], (error, results) => {
                    if (error) {
                        reject(error);
                    }
                    else {
                        resolve(results);
                    }
                });
            });
        });
    }
}
exports.default = LoginModel;
