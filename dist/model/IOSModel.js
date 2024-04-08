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
class IOSModel {
    constructor(pool) {
        this.pool = pool;
    }
    getIOSrecords(Jd) {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "INSERT INTO ioscountries (extras) VALUES (?)";
            const extras = Jd;
            const values = [extras];
            return new Promise((resolve, reject) => {
                this.pool.query(sql, values, (error, results) => {
                    if (error) {
                        reject(error);
                        console.log("Error Found!", error);
                    }
                    else {
                        resolve(results);
                        console.log("Response from db", results);
                    }
                });
            });
        });
    }
}
exports.default = IOSModel;
