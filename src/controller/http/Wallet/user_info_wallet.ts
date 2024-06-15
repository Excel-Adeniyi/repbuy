import { Request, Response } from "express";
import UserInformationWallet from "../../../model/UserInformationFromWallet/user_information_wallet";


interface DataProps {
    userId: number,
    fullname_company: string,
    country: string,
    state: string,
    city: string,
    zipcode: string,
    address: string,
    created_at: Date,
    updated_at: Date
}
interface Data2Props {
    userId: number,
    updated_at: Date

}
class UserAdditionDetailsController {
    private model: UserInformationWallet

    constructor(model: UserInformationWallet){
        this.model = model
    }


    async  addingDetails(req: Request, res: Response): Promise<void>{
        const userDetails = req.body
        console.log(userDetails)
        const updated_at_dateTime = new Date()
        const created_at_dateTime = new Date()
        try {
            const payload: Data2Props =  {
                updated_at: updated_at_dateTime,
                userId: parseInt(userDetails.userId),
                
            }
            const userPayload:DataProps = {
                userId: parseInt(userDetails.userId),
                fullname_company: userDetails.fullname_company,
                country: userDetails.country,
                state: userDetails.state,
                city: userDetails.city,
                zipcode: userDetails.zip,
                address: userDetails.address,
                created_at: created_at_dateTime,
                updated_at: updated_at_dateTime

            }
            const responseData: any = await this.model.submitInfo(userPayload, payload)
            if(responseData.affectedRows !== 0){
                res.status(200).json({Success: true, message: "User Record Saved Successfully"})
            }else{
                res.status(503).json({Success: false, message: "Record not Saved"})
            }
        } catch (error) {
            console.log(error)
            res.status(500).json({Success: false, message: "Internal Server Error"})
        }
    }
}

export default UserAdditionDetailsController