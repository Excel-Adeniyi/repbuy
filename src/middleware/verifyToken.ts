import { NextFunction, Request, Response } from 'express'
import jwt from 'jsonwebtoken'

async function JToken(req: Request, res: Response, next: NextFunction) {
    const { jtoken } = req.body
    try {
        const secret: any = process.env.JWEB
        const verifiedToken = jwt.verify(jtoken, secret);
        //console.log(verifiedToken)
        if (jtoken) {
            next()
        } else {
            res.status(401).json({ success: false, message: "Unauthorized Access" })
        }
    } catch (error) {
        //console.log(error)
        res.status(500).json({ error: "Unauthorized Access" })
        
    }


}

export default JToken