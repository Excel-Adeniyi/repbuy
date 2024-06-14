import pools from "../../../config/dbConfigPromise";
import WalletController from "../../../controller/http/Wallet/wallet_balance";
import WalletModel from "../../../model/WalletModel/wallet_model";



const walletmodel = new WalletModel(pools)
const walletController = new WalletController(walletmodel)

export default walletController