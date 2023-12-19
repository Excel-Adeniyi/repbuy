import {Router} from 'express'
import GetAuth from '../controller/getAuth'
import GetAirtime from '../controller/getAirtime'
import GetBalance from '../controller/getBalance'

let router = Router()

router.post('/auth', GetAuth)
router.post('/airtime', GetAirtime)
router.get('/balance', GetBalance)

export {router }