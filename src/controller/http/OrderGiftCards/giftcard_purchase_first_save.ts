import { Request, Response } from "express";
import GiftCardSaveBeforePaymentModel from "../../../model/GiftCardModel/giftcard_save_before_payment";




class GiftCardPurchaseBeforePayment {
    private model: GiftCardSaveBeforePaymentModel


    constructor(model: GiftCardSaveBeforePaymentModel) {
        this.model = model
    }

    async cardPurchase(req: Request, res: Response): Promise<void> {
        const payload = req.body
        console.log(payload)
        try {
            const data1 = {
                operatorId: payload.productId, amount: payload.amount, countryCode: payload.recipientPhoneDetails.countryCode, number: payload.recipientPhoneDetails.phoneNumber, userId: payload.userId, ntransactionId: payload.customIdentifier, purchase_type: payload.product_type
            }
            const data2 = {
                userId: payload.userId, transaction_id_customer_id: payload.customIdentifier, recipient_email: payload.recipientEmail, recipient_phone: payload.recipientPhoneDetails.phoneNumber, country_code: payload.recipientPhoneDetails.countryCode, quantity: payload.quantity, unit_price: payload.unitPrice
            }

            const data3 = {
                ntransactionId: payload.customIdentifier
            }
            const payloadData = await this.model.firstSave(data1, data2, data3)

            if (payloadData.length > 0) {
                res.status(200).json({ Success: true, message: payloadData })
            } else {
                res.status(503).json({ Success: false, message: "Currently not available" })
            }

        } catch (error: any) {
            console.log(error)
            res.status(500).json({ Success: false, message: "Internal Server Error" })



        }
    }
}

export default GiftCardPurchaseBeforePayment