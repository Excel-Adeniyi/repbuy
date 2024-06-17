import pool from "../../../config/dbConfig";
import CurrentWalletBalanceController from "../../../controller/http/Wallet/current_wallet_balance";
import CurrentWalletBalanceModel from "../../../model/WalletModel/get_wallet_balance";






const get_wallet_balance = new CurrentWalletBalanceModel(pool)
const current_balance_wallet = new CurrentWalletBalanceController(get_wallet_balance)

export default current_balance_wallet