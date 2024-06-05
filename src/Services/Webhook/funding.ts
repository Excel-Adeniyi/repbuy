import { Request, Response } from "express";
import * as crypto from 'crypto'

class FundingWebhook{

    async AccountWebhook(req: Request, res: Response): Promise<void>{
        const secret: string = process.env.PAY_SECRET || "Ddfrgrgtrssds"
        const hash = crypto.createHmac('sha256', secret).update(JSON.stringify(req.body)).digest('hex')
        const reqhash = req.headers['x-paystack-signature']
        if(hash === reqhash){
            const events = req.body
            if(events.event == "customeridentification.success"){
                
            }

        }
    }
}

export default FundingWebhook