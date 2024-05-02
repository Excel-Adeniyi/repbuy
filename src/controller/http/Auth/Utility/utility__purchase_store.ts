import { Request, Response } from "express";
import UtilityPurchase from "../../../../model/UtilityModel/utility_purchase_model";

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
                const response: any = await this.model.utilityPurchaseModel(data)
                if(response.affectedRows === 1){
                    console.log("Success")
                    res.status(200).json({Success: true, message: "Saved"})
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