import { Request, Response } from "express";
import CurrentWalletBalanceModel from "../../../model/WalletModel/get_wallet_balance";



class CurrentWalletBalanceController{
    private model:  CurrentWalletBalanceModel

    constructor(model: CurrentWalletBalanceModel){
        this.model = model
    }

    async walletBalance(req: Request, res: Response): Promise<void>{
        const {userId} = req.params

        try {
            const row = await this.model.getbalance(userId)
            if(row.length > 0){
                res.status(200).json({Success: true, message: row})
            }else {
                res.status(503).json({Success: false, message: 'Unable to fetch data'})
            }
        } catch (error) {
            console.log(error)
            res.status(500).json({Success: false, message: 'Internal Server Error'})
        }
    }
}

export default CurrentWalletBalanceController