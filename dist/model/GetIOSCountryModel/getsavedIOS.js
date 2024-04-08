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
class GETSavedIOSModel {
    constructor(pool) {
        this.pool = pool;
    }
    getSavedIOSRecords() {
        return __awaiter(this, void 0, void 0, function* () {
            const sql = "SELECT * FROM ioscountries ORDER BY id DESC LIMIT 1";
            return new Promise((resolve, reject) => {
                this.pool.query(sql, (error, results) => {
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
exports.default = GETSavedIOSModel;
