import { Request, Response } from "express";
import WalletModel from "../../../model/WalletModel/wallet_model";
import axios, { AxiosError, AxiosResponse } from "axios";
import { RowDataPacket } from "mysql2";


interface walletProps {
    userId: number,
    current_balance: number,
    last_deposit_amount: number,
    total_overall_deposit: number,
    channel: string,
    last_funded: Date,
    created_at: Date
}
interface currentPurchaseProps {
    //userID+method of payment
    operatorId: string,

    //last_deposti_amount
    amount: string,

    //currency_type
    countryCode: string,
    number: string,
    userId: number,
    time: Date,
    ntransactionId: string,
    purchase_type: string,
    status: string
}

interface propsTypes {
    wallet: walletProps,
    currentPurchase: currentPurchaseProps
}

class WalletController {
    private model: WalletModel

    constructor(model: WalletModel) {
        this.model = model
    }

    async verifyPayment(req: Request, res: Response): Promise<void> {
        const { reference, userId, accessCode, current_balance, total_overall_deposit } = req.body
        console.log(reference)
        const data = {
            reference, userId, accessCode
        }
        console.log("CHECKING THE VERIFIER", data)
        try {
            if (reference != undefined && reference != null) {
                const url = "https://api.paystack.co/transaction/verify/"

                const response: AxiosResponse = await axios.get(`${url}${reference}`);
               
                const responseData = response.data

                // console.log("VERIFIER", responseData)
                if (responseData.message === "Verification successful") {
                    const last_funded_dateTime = new Date(responseData.data.paid_at)
                    const create_at_datetTime = new Date(responseData.data.created_at)
                    // console.log("DATETIME", dateTime)
                    const wallet = {
                        userId,
                        current_balance,
                        last_deposit_amount: responseData.data.amount/100,
                        total_overall_deposit,
                        last_funded: last_funded_dateTime,
                        channel: responseData.data.channel,
                        created_at: create_at_datetTime
                    }
                    const currentPurchase = {
                        operatorId: responseData.data.id,

                        //last_deposti_amount
                        amount: (responseData.data.amount/100).toString(),

                        //currency_type
                        countryCode: responseData.data.currency,
                        number: responseData.data.receipt_number,
                        userId,
                        time: create_at_datetTime,
                        ntransactionId: reference,
                        purchase_type: "Funding",
                        status: responseData.data.status === "success" ? 'successful' : 'pending'
                    }
                    const currentParams: propsTypes = {
                        wallet, currentPurchase
                    }
                    const rows: RowDataPacket[] = await this.model.saveToWallet(currentParams)
                    console.log("Update response", rows)
                    if (rows.length > 0) {
                        res.status(200).json({ Success: true, message: rows})
                    } else {
                        res.status(503).json({ Success: false, message: "Issue processing Payments" })
                    }

                } else {
                    res.status(503).json({ Success: false, message: responseData.data.message })
                }
                // console.log(responseData)
            }
        } catch (error) {
            console.log(error)
            if (axios.isAxiosError(error)) {
                const axiosError = error as AxiosError

                if (axiosError.response) {
                    res.status(504).json({ Success: false, message: "Gateway Timeout" })
                } else if (axiosError.request) {
                    res.status(400).json({ Success: false, message: "Bad Request" })
                } else {
                    res.status(500).json({ Success: false, message: "Internal Server Error" })
                }
            }
        }
    }
}

export default WalletController