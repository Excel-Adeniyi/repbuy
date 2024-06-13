import pools from "../../../config/dbConfigPromise";
import GiftCardPurchaseBeforePayment from "../../../controller/http/OrderGiftCards/giftcard_purchase_first_save";
import GiftCardSaveBeforePaymentModel from "../../../model/GiftCardModel/giftcard_save_before_payment";




const giftcardFirstDBsave = new GiftCardSaveBeforePaymentModel(pools)
const giftcardpurchasebeforePayment = new GiftCardPurchaseBeforePayment(giftcardFirstDBsave)

export default giftcardpurchasebeforePayment
