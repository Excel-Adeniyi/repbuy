"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function isEmpty(obj) {
    console.log("ERE", obj);
    return Object.values(obj).length > 0;
}
exports.default = isEmpty;
