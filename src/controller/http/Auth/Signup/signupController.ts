import { Request, Response } from "express";
import SignupModel from "../../../../model/AuthModel/signupModel";
import { RowDataPacket } from "mysql2";
import jwt from 'jsonwebtoken'

interface InfoType {
    email: string,
    phone_number: string
}

interface PropType {
    InfoType: InfoType
}
class SignUPController {
    private model: SignupModel

    constructor(model: SignupModel) {
        this.model = model
    }
    async createAccount(req: Request, res: Response): Promise<void> {
        const { first_name, last_name, email, country, phone_number, password, terms_n_condition } = req.body
        const data = {
            first_name, last_name, email, country, phone_number, password, terms_n_condition
        }
        console.log(data);
        try {
            const checkInfo: any = await this.model.checkUserModel(email, phone_number)
           console.log(checkInfo)
           if(checkInfo.length > 0){
            if (checkInfo[0]?.phone_number === phone_number && checkInfo[0]?.email.toLowerCase() === email.toLowerCase()) {

                res.status(409).json({ success: false, message: 'This Email address and Phone number are already registered' });
            } else if (checkInfo[0].phone_number === phone_number) {

                res.status(409).json({ success: false, message: 'This Phone number Is Already Registered' });
                console.log("hey")
            } else if (checkInfo[0].email.toLowerCase() === email.toLowerCase()) {

                res.status(409).json({ success: false, message: 'This Email address Is Already Registered' });
            } else {
               
               
                if (data.terms_n_condition === 1 && checkInfo[0].phone_number !== phone_number && checkInfo[0].email.toLowerCase() !== email.toLowerCase()) {
                    const modelRes = await this.model.createUserModel(data)
                    console.log(modelRes)
                    res.status(200).json({ success: true, message: 'User account created successfully.' });
                }
            }
        }else{
            const modelRes = await this.model.createUserModel(data)
            console.log(modelRes)
            res.status(200).json({ success: true, message: 'User account created successfully.' });
        }
        } catch (error) {
            console.log(error)
            res.status(500).json({ success: false, message: 'Internal server error.' });
        }
    }
    async updateAvater(req: Request, res: Response): Promise<void>{
        const {userAvater, email, password} = req.body

        const data = {
            userAvater, email, password
        }
        try{
            const response: any = await this.model.updateAvater(data)

            if(response.affectedRows == 1){
                const  userData:any = await this.model.userdata(data)
                console.log(userData)
                if(userData.length > 0){
                    const condata = userData[0]
                    console.log(condata)
                    const secret: any = process.env.JWEB
                    const token = jwt.sign(condata, secret, { expiresIn: '1h' })
                res.status(200).json({success: true, message: "Avater Uploaded", data: token})
                }
            }else{
                res.status(424).json({success: false, message: "Upload Unsuccessful"})
            }
        }catch(error){
            console.log(error)
            res.status(500).json({ success: false, message: 'Internal server error.' });
        }
    }
}

export default SignUPController
