import { Request, Response } from "express";
import UtilitySingleDataRequest from "../../../model/UtilityModel/utility_single_data_request";
import SinglePurchasedData from "../../../model/SingleData/single_data";


class GetOnePurchasedItem {

    private model: UtilitySingleDataRequest
    private singleModel: SinglePurchasedData

    constructor(model: UtilitySingleDataRequest, singleModel: SinglePurchasedData) {
        this.model = model;
        this.singleModel = singleModel
    }

    async provideSingleData(req: Request, res: Response): Promise<void> {
        const { type, ntransactionId, userId } = req.params
        try {
            if (type === "Electric") {
                const SingleEletricData = await this.model.singleData(userId, ntransactionId)
                if (SingleEletricData && SingleEletricData.length > 0) {
                    res.status(200).json({ Success: true, message: SingleEletricData })
                }else{
                    res.status(503).json({Success: false, message: "Data does not exist"})
                }
            } else {
                const SingleData = await this.singleModel.SinglePurchaseData(userId, ntransactionId, type)
                if(SingleData.length > 0){
                    res.status(200).json({Success:true, message: SingleData})
                }
                res.status(503).json({Success: false, message: "Data does not exist"})
            }

        } catch (error) {
            res.status(500).json({Success: false, meesage: "internal Server Error"})
        }
    }
}

export default GetOnePurchasedItem