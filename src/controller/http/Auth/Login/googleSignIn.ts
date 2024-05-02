import { Request, Response } from "express";
import SignupModel from "../../../../model/AuthModel/signupModel";
import jwt from 'jsonwebtoken'
import { RowDataPacket } from "mysql2";

interface InfoType {
    email: string,
    phone_number: string
}

interface PropType {
    InfoType: InfoType
}
class GoogleSignInController {
    private model: SignupModel

    constructor(model: SignupModel) {
        this.model = model
    }
    async createAccount(req: Request, res: Response): Promise<void> {
        const { first_name, email } = req.body
        const data = {
            first_name, email
        }
        try {
            const checkInfo: any = await this.model.checkGoogleModel(email)

            if (checkInfo[0].email.toLowerCase() === email.toLowerCase()) {

                const userData = {
                    id: checkInfo[0].id,
                    first_name: checkInfo[0].first_name,
                    last_mame: checkInfo[0]?.last_name,
                    country: checkInfo[0]?.country,
                    email: checkInfo[0]?.email,
                    phone_number: checkInfo[0]?.phone_number
                }
                    console.log(userData)
                    const secret: any = process.env.JWEB
                    const token = jwt.sign(userData, secret, { expiresIn: '1h' })
                res.status(200).json({ success: false, message: token });
                }else {


                    if (checkInfo[0].email.toLowerCase() !== email.toLowerCase()) {
                        const modelRes = await this.model.GoogleSignInModel(data)
                        console.log(modelRes)
                        const userData = {
                            id: checkInfo[0].id,
                            first_name: checkInfo[0].first_name,
                            last_mame: checkInfo[0].last_name,
                            country: checkInfo[0].country,
                            email: checkInfo[0].email,
                            phone_number: checkInfo[0].phone_number
                        }
                            console.log(userData)
                            const secret: any = process.env.JWEB
                            const token = jwt.sign(userData, secret, { expiresIn: '1h' })
                        res.status(200).json({ success: false, message: token });
                    }
                }
            } catch (error) {
                console.log(error)
                res.status(500).json({ success: false, message: 'Internal server error.' });
            }
        }
}

export default GoogleSignInController
