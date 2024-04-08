"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_session_1 = __importDefault(require("express-session"));
const SessionData = (req, res, next) => {
    try {
        // console.log("CHECK SESSIon");
        (0, express_session_1.default)({
            secret: process.env.SESSION_SECRET || "sajdsjfkf3f39fkssajna0fk2@aokds923jka!jksd",
            resave: false,
            saveUninitialized: true,
            cookie: { secure: true }
        })(req, res, next); // Invoking the session middleware and passing req, res, and next
    }
    catch (error) {
        console.log(error);
        next(error); // Pass the error to the next middleware
    }
};
exports.default = SessionData;
