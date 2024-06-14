import pools from "../../../config/dbConfigPromise";
import UserAdditionDetailsController from "../../../controller/http/Wallet/user_info_wallet";
import UserInformationWallet from "../../../model/UserInformationFromWallet/user_information_wallet";



const user_info_wallet = new UserInformationWallet(pools)

const user_additional_details_controller = new UserAdditionDetailsController(user_info_wallet)

export default user_additional_details_controller