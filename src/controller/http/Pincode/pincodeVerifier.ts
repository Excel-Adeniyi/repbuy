import { Request, Response } from "express";
import Pincode from "../../../model/PincodeModel/pincode_model";

class PinCodeVerify {
    private model: Pincode

    constructor(model: Pincode) {
        this.model = model
    }
    async initiateVerify(req: Request, res: Response): Promise<void> {
        const { user_id, user_pin } = req.body
        try {
            const data = {
                user_id, user_pin
            }
            console.log(data);
            const recievedPin = await this.model.PincodeModel(data)
            console.log(recievedPin[0].user_pin )
            const converted_pin = parseInt(user_pin)
            console.log(converted_pin)
            if (recievedPin[0].user_pin === converted_pin) {
                res.status(200).json({ Success: true, message: "proceed to payment" })
            } else {
                res.status(503).json({ Success: false, message: "Pin not valid" })
            }

        } catch (error) {
            res.status(500).json({ Success: false, message: "Internal Server error" })
        }
    }
}

export default PinCodeVerify