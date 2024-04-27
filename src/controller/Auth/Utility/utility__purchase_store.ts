import { Request, Response } from "express";
import UtilityPurchase from "../../../model/UtilityModel/utility_purchase_model";

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
                }
            }
        } catch (error) {
            console.log(error)
        }
    }
}

export default UtilityPurchaseController