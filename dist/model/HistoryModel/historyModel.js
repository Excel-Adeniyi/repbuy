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
class HistoryModel {
    constructor(pool) {
        this.pool = pool;
    }
    History_Model(data) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = 'INSERT INTO current_purchase (operatorId, amount, countryCode, number, userId, time) VALUES (?,?,?,?,?,?)';
            const dataReq = [data.operatorId, data.amount, data.countryCode, data.number, data.userId, data.timeData];
            return new Promise((resolve, reject) => {
                this.pool.query(sql, dataReq, (error, results) => {
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
    Update_History_Model(data) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = 'UPDATE current_purchase SET transactionId = ?, success = 1 WHERE userId= ? ORDER BY time DESC LIMIT 1';
            const dataReq = [data.transactionId, data.userId];
            return new Promise((resolve, reject) => {
                this.pool.query(sql, dataReq, (error, results) => {
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
}
exports.default = HistoryModel;
