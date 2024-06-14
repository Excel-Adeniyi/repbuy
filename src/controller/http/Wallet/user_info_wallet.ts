import { Request, Response } from "express";
import UserInformationWallet from "../../../model/UserInformationFromWallet/user_information_wallet";


interface DataProps {
    userId: number,
    fullname_company: string,
    country: string,
    state: string,
    zip: string,
    address: string
}
interface Data2Props {
    userId: number,

}
class UserAdditionDetailsController {
    private model: UserInformationWallet

    constructor(model: UserInformationWallet){
        this.model = model
    }


    async  addingDetails(req: Request, res: Response): Promise<void>{
        const userDetails = req.params
        try {
            const payload: Data2Props =  {
                userId: parseInt(userDetails.userId)
            }
            const userPayload:DataProps = {
                userId: parseInt(userDetails.userId),
                fullname_company: userDetails.fullname_company,
                country: userDetails.country,
                state: userDetails.state,
                zip: userDetails.zip,
                address: userDetails.address
            }
            const responseData: any = await this.model.submitInfo(userPayload, payload)
            if(responseData.affectedRows !== 0){
                res.status(200).json({Success: true, message: "User Record Saved Successfully"})
            }else{
                res.status(503).json({Success: false, message: "Record not Saved"})
            }
        } catch (error) {
            res.status(500).json({Success: false, message: "Internal Server Error"})
        }
    }
}