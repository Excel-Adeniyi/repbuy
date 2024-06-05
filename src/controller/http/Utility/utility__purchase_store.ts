import { Request, Response } from "express";
import UtilityPurchase from "../../../model/UtilityModel/utility_purchase_model";
import { reference } from "../../../helper/reference";

class UtilityPurchaseController{
    private model: UtilityPurchase

    constructor(model: UtilityPurchase){
        this.model=  model
    }

    async utilitypurchasecontroller(req:Request, res: Response): Promise<void>{
        const data = req.body
        console.log("Purchase DATA",data)
        try {
            if(data !== undefined){
                const ntransactionId = data.userId as string + reference() as string
                console.log('nTRANSACTION ID:', ntransactionId)
                const response: any = await this.model.utilityPurchaseModel(data, ntransactionId)
                if(response.affectedRows === 1){
                    console.log("Success")
                    res.status(200).json({Success: true, message: "Saved", reference: ntransactionId})
                }else{
                    res.status(503).json({Success: false, message: "Unsaved"})
                }
            }
        } catch (error) {
            console.log(error)
            res.status(500). json({Success: false, message: "Internal Server Error"})
        }
    }
}

export default UtilityPurchaseController