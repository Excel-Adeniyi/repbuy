import IOSModel from '../../model/IOSModel'
import IOSController from '../../controller/saveIOS'
import pool from '../../config/dbConfig'

const iosModel = new IOSModel(pool)
const iosController = new IOSController(iosModel)

export default iosController