"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.FinalDigit = exports.ValueDigit = void 0;
const ValueDigit = () => { return Math.floor(1000 + Math.random() * 9000); };
exports.ValueDigit = ValueDigit;
const FinalDigit = () => { return Math.floor(100000 + Math.random() * 900000); };
exports.FinalDigit = FinalDigit;
