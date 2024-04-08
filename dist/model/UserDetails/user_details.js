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
class User_detailsMODEL {
    constructor(pool) {
        this.pool = pool;
    }
    getUserDetails(userID) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "SELECT email from  user_account WHERE id=?";
            console.log(userID);
            const dataReq = [userID];
            return new Promise((resolve, reject) => {
                this.pool.query(sql, dataReq, (error, results) => {
                    if (error) {
                        console.log("DB error in getting error", error);
                        reject(error);
                    }
                    else {
                        resolve(results);
                        console.log("Succefully Fetched details");
                    }
                });
            });
        });
    }
}
exports.default = User_detailsMODEL;
