import pool from "../../../config/dbConfig";
import GiftcardProcessPurchase from "../../../controller/http/OrderGiftCards/giftcard_payment";
import GiftcardUpdatePostPayent from "../../../model/GiftCardModel/giftcard_update_after_payment";


const giftcardupdatepostPayment = new GiftcardUpdatePostPayent(pool)
const giftcardProcessOrder = new GiftcardProcessPurchase(giftcardupdatepostPayment)

export default giftcardProcessOrder