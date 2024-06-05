import pools from "../../../config/dbConfigPromise";
import FCMStorageController from "../../../controller/http/FCMTokenStore/fcm_store_controller";
import FCMStorageModel from "../../../model/FCMTokenStoreModel/fcm_store_model";



const fcmstoragemodel = new FCMStorageModel(pools)
const fcmStorageController = new FCMStorageController(fcmstoragemodel)

export default fcmStorageController
