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
class AirtimeDataClass {
    constructor(pool) {
        this.pool = pool;
    }
    GetAirtimeModel(data) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = 'UPDATE current_purchase SET transactionId = ?, success = 1 WHERE userId= ? ORDER BY time DESC LIMIT 1';
            const dataReq = [data.transactionId, data.userId];
            return new Promise((resolve, reject) => {
                this.pool.query(sql, dataReq, (error, results) => {
                    if (error) {
                        reject(error);
                        console.log("error occured:", error);
                    }
                    else {
                        resolve(results);
                        console.log("finito");
                    }
                });
            });
        });
    }
    CHECKOTP(data) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "SELECT * FROM otp WHERE otp = ? and u_id = ?";
            const dataReq = [data.otp, data.userId];
            console.log(dataReq);
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
exports.default = AirtimeDataClass;
