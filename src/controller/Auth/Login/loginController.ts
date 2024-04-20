import { Request, Response } from "express";
import LoginModel from "../../../model/AuthModel/loginModel";
import jwt from 'jsonwebtoken'
import dotenv from 'dotenv';
import GetAuthTopUP from "../getAuthTopup";
dotenv.config()

class LoginController {
    private model: LoginModel

    constructor(model: LoginModel) {
        this.model = model
    }

    async loginAccount(req: Request, res: Response): Promise<void> {
        const data = req.body
        console.log(data)


        const dataRs = data?.userdata
        console.log(dataRs)

        const email = data.email;
        let resData: any[] = []
        try {
            if (typeof dataRs === 'string' && /^\d+$/.test(dataRs)) {
                console.log('HI', data.userdata);
                const modelResult = await this.model.loginMobileData(data)
                if (modelResult.length > 0) {
                    const userData = {
                        id: modelResult[0].id,
                        first_name: modelResult[0].first_name,
                        last_mame: modelResult[0].last_name,
                        country: modelResult[0].country,
                        email: modelResult[0].email,
                        phone_number: modelResult[0].phone_number,
                        userpin: modelResult[0].userpin,
                        verified: modelResult[0].verified,
                        avatar: modelResult[0].avatar
                    }
                    console.log(userData)
                    const secret: any = process.env.JWEB
                    const token = jwt.sign(userData, secret, { expiresIn: '1h' })
                    // const results = await GetAuthTopUP(req, res)
                    resData.push({ success: true, message: token, payload: userData })
                } else {
                    resData.push({ success: false, message: "User with the mobile doesn't exit" })
                }
                res.status(200).json(resData)
            } else {
                console.log('Invalid dataRs:', dataRs);
                if (/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(dataRs)) {
                    const modelResult = await this.model.loginData(data)
                    console.log(modelResult)
                    if (modelResult.length > 0) {
                        const userData = {
                            id: modelResult[0].id,
                            first_name: modelResult[0].first_name,
                            last_mame: modelResult[0].last_name,
                            country: modelResult[0].country,
                            email: modelResult[0].email,
                            phone_number: modelResult[0].phone_number,
                            userpin: modelResult[0].userpin,
                            verified: modelResult[0].verified,
                            avatar: modelResult[0].avatar
                        }
                        console.log(userData)
                        const secret: any = process.env.JWEB
                        const token = jwt.sign(userData, secret, { expiresIn: '1h' })
                        // const results = await GetAuthTopUP(req, res)
                        resData.push({ success: true, message: token, payload: userData })
                    } else {
                        resData.push({ success: false, message: "User doesn't exit" })
                    }
                } else {
                    resData.push({ success: false, message: "Login details doesn't match requirement" })
                }
                res.status(200).json(resData)
            }

        } catch (error) {
            console.log(error)
            res.status(500).json("Internal Server Error")
        }
    }
}

export default LoginController