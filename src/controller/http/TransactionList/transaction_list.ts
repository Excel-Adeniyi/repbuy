import { Request, Response } from "express";
import TransactionList from "../../../model/TransactionList/transaction_list";
import { RowDataPacket } from "mysql2";



class TransactionListController {
    private model: TransactionList

    constructor(model: TransactionList) {
        this.model = model
    }

    async getlist(req: Request, res: Response): Promise<void> {
        try {
            const { userId } = req.params
            const transList = await this.model.getList(userId)
            if (transList.length > 0) {
                res.status(200).json({ Success: true, message: transList })
            } else {
                res.status(503).json({ Success: false, message: "Unable to provide list" })
            }

        } catch (error) {
            //console.log(error)
            res.status(503).json({ Success: false, message: "Unable to provide list" })
        }
    }
}

export default TransactionListController