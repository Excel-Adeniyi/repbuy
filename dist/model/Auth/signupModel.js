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
class SignupModel {
    constructor(pool) {
        this.pool = pool;
    }
    createUserModel(data) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "INSERT INTO user_account (first_name, last_name, email, country, phone_number, password, terms_n_condition) VALUES (?,?,?,?,?,?,?)";
            console.log(data);
            return new Promise((resolve, reject) => {
                this.pool.query(sql, [...Object.values(data)], (error, results) => {
                    if (error) {
                        reject(error);
                        console.log("Error Found in GetSavedIOSModel", error.message);
                    }
                    else {
                        resolve(results);
                        console.log("Successfully fetched data");
                    }
                });
            });
        });
    }
    GoogleSignInModel(data) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "INSERT INTO user_account (first_name, email) VALUES (?,?)";
            console.log(data);
            return new Promise((resolve, reject) => {
                this.pool.query(sql, [...Object.values(data)], (error, results) => {
                    if (error) {
                        reject(error);
                        console.log("Error Found in GetSavedIOSModel", error.message);
                    }
                    else {
                        resolve(results);
                        console.log("Successfully fetched data");
                    }
                });
            });
        });
    }
    checkGoogleModel(email) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "SELECT * FROM infoChecker WHERE email = ?";
            // console.log(data)
            return new Promise((resolve, reject) => {
                this.pool.query(sql, [email], (error, results) => {
                    if (error) {
                        reject(error);
                        console.log("Error Found in GetSavedIOSModel", error.message);
                    }
                    else {
                        resolve(results);
                        console.log(results);
                    }
                });
            });
        });
    }
    checkUserModel(email, phone_number) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "SELECT * FROM infoChecker WHERE email = ?  OR phone_number = ?";
            // console.log(data)
            return new Promise((resolve, reject) => {
                this.pool.query(sql, [email, phone_number], (error, results) => {
                    if (error) {
                        reject(error);
                        console.log("Error Found in GetSavedIOSModel", error.message);
                    }
                    else {
                        resolve(results);
                        console.log(results);
                    }
                });
            });
        });
    }
    updateAvater(data) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "UPDATE user_account SET avatar = ? WHERE email = ?";
            const params = [data.userAvater, data.email];
            return new Promise((resolve, reject) => {
                this.pool.query(sql, params, (error, results) => {
                    if (error) {
                        reject(error);
                        console.log("Error Found in GetSavedIOSModel", error.message);
                    }
                    else {
                        resolve(results);
                        console.log(results);
                    }
                });
            });
        });
    }
    userdata(data) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "SELECT * FROM user_account WHERE email = ? AND password = ?";
            const params = [data.email, data.password];
            return new Promise((resolve, reject) => {
                this.pool.query(sql, params, (error, results) => {
                    if (error) {
                        reject(error);
                        console.log("Error Found in GetSavedIOSModel", error.message);
                    }
                    else {
                        resolve(results);
                        console.log(results);
                    }
                });
            });
        });
    }
}
exports.default = SignupModel;
