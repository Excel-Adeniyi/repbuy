import { Request, Response } from "express";
import FCMStorageModel from "../../../model/FCMTokenStoreModel/fcm_store_model";


class FCMStorageController {
    private model: FCMStorageModel


    constructor(model: FCMStorageModel) {
        this.model = model;
    }

    async fcmstorer(req: Request, res: Response): Promise<void> {
        const { userid, fcm_token } = req.body
        const data = {
            id: userid,f_token: fcm_token
        }
        console.log(data)
        try {
            const initiateStorage: string | undefined = await this.model.fcmstore(data)
            console.log(initiateStorage)
            if (initiateStorage === "Token processed Successfully"){
                res.status(200).json({Success: true, message: "Token processed Successfully" })
            }
        } catch (error: any) {
            console.log(error)
            res.status(500).json({Success: false, message: error.message})
        }
    }
}

export default FCMStorageController