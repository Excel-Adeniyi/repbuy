/// <reference path="../types/session.d.ts" />
import csrf from "csrf";
import { NextFunction, Request, Response } from "express";
const tokens = new csrf()
async function VerifyXTOKEN(req: Request, res: Response, next: NextFunction) {
    let { x_csrf } = req.body
    try {
        //console.log("XRF", x_csrf)
        if (x_csrf !== undefined) {
            const session_key: string = req.session.csrfSecret as string
            //console.log("SESSION KEY:",req.session.csrfSecret)
            const verified = tokens.verify(session_key, x_csrf)
            //console.log('VERRI:', verified)
            if (!verified) {
                res.status(401).json({ success: false, message: "Csrf cannpt be verified" })
            } else {
                next()
            }

        } else {
            res.status(401).json({ success: false, message: "Unathorized Access" })
        }
    } catch (error) {
        res.status(500).json({ success: false, message: "Inernal server error" })
    }
}

export default VerifyXTOKEN

