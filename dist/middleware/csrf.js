"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
/// <reference path="../types/session.d.ts" />
const csrf_1 = __importDefault(require("csrf"));
const tokens = new csrf_1.default();
const CsrfData = (req, res, next) => {
    // Generate a new CSRF secret
    try {
        const csrfSecret = tokens.secretSync();
        // Store the CSRF secret in the session
        req.session.csrfSecret = csrfSecret;
        // Generate a CSRF token for the current request
        const csrfToken = tokens.create(csrfSecret);
        //  console.log(csrfToken)
        // Make the CSRF token available in the response locals
        res.status(200).json({ success: true, message: csrfToken });
        // Continue to the next middleware or route handler
    }
    catch (error) {
        console.log(error);
    }
};
exports.default = CsrfData;
