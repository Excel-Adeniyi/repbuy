"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
// cache.ts
const node_cache_1 = __importDefault(require("node-cache"));
const myCache = new node_cache_1.default({ stdTTL: 5 * 60 });
exports.default = myCache;
