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
class OTPModel {
    constructor(pool) {
        this.pool = pool;
    }
    OTPObj(data) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "INSERT INTO otp (otp, u_id)  VALUES (?, ?)";
            const dataReq = [data.digits, data.userId];
            console.log(dataReq);
            return new Promise((resolve, reject) => {
                this.pool.query(sql, dataReq, (error, results) => {
                    if (error) {
                        reject(error);
                        console.log("Error found in request", error.message);
                    }
                    else {
                        resolve(results);
                        console.log("Successfully recieved data");
                    }
                });
            });
        });
    }
    GetID(email) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "SELECT * FROM user_account WHERE email = ?";
            return new Promise((resolve, reject) => {
                this.pool.query(sql, [email], (error, results) => {
                    if (error) {
                        reject(error);
                        console.log("Error found in request", error.message);
                    }
                    else {
                        resolve(results);
                        console.log("Successfully Checked data", results);
                    }
                });
            });
        });
    }
    CreatePincode(data) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "UPDATE user_account SET userpin = ? WHERE email = ?";
            const payload = [data.pincode, data.email];
            console.log(payload);
            return new Promise((resolve, reject) => {
                this.pool.query(sql, payload, (error, results) => {
                    if (error) {
                        reject(error);
                        console.log("Error found in request", error.message);
                    }
                    else {
                        resolve(results);
                        console.log("Successfully Checked data", results);
                    }
                });
            });
        });
    }
    CHECKOTP(data) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "SELECT * FROM otp WHERE u_id = ?";
            const dataReq = [data.userId];
            return new Promise((resolve, reject) => {
                this.pool.query(sql, dataReq, (error, results) => {
                    if (error) {
                        reject(error);
                        console.log("Error found in request", error.message);
                    }
                    else {
                        resolve(results);
                        console.log("Successfully Checked data");
                    }
                });
            });
        });
    }
    VerifyEmail(id) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "UPDATE user_account SET verified = 1 WHERE id = ?";
            return new Promise((resolve, reject) => {
                this.pool.query(sql, [id], (error, results) => {
                    if (error) {
                        reject(error);
                        console.log("Error found in request", error.message);
                    }
                    else {
                        resolve(results);
                        console.log("Successfully Checked data", results);
                    }
                });
            });
        });
    }
    UPDATEOTP(data) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "UPDATE otp SET otp=?, time=CURRENT_TIMESTAMP() WHERE u_id = ?";
            const dataReq = [data.digits, data.userId];
            return new Promise((resolve, reject) => {
                this.pool.query(sql, dataReq, (error, results) => {
                    if (error) {
                        reject(error);
                        console.log("Error found in request", error.message);
                    }
                    else {
                        resolve(results);
                        console.log("Successfully Checked data");
                    }
                });
            });
        });
    }
}
exports.default = OTPModel;
