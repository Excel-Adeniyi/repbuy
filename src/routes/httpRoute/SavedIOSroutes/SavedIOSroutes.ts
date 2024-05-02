import GETSavedIOSModel from "../../../model/GetIOSCountryModel/getsavedIOS";
import GetSavedIOSController from "../../../controller/http/GETIOSCountry/savedIOS";
import pool from '../../../config/dbConfig'

const getSavedIosModel = new GETSavedIOSModel(pool)
const getSavedIosroute = new GetSavedIOSController(getSavedIosModel)

export default getSavedIosroute