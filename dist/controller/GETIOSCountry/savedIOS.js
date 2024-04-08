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
class GetSavedIOSController {
    constructor(model) {
        this.model = model;
    }
    getAllDbIosRecords(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const records = yield this.model.getSavedIOSRecords();
                if (records.length !== 0) {
                    const jsonRecord = JSON.parse(records[0].extras);
                    console.log();
                    res.json({ success: true, message: jsonRecord });
                }
                else {
                    res.json({ success: true, message: "Error Fetching Data" });
                }
            }
            catch (error) {
                console.log("Error from SavedIOSController", error);
                res.status(500).json({ error: "Internal Server Error" });
            }
        });
    }
}
exports.default = GetSavedIOSController;
