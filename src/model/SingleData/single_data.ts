import { QueryError, RowDataPacket } from "mysql2";
import { Pool } from "mysql2/typings/mysql/lib/Pool";



class SinglePurchasedData{
    private pool: Pool
    constructor(pool: Pool){
        this.pool = pool
    }

    async SinglePurchaseData(userId : string , ntransactionId: string, purchase_type: string): Promise<RowDataPacket[]>{
        const query = "SELECT operatorId, amount, number, ntransactionId, status FROM current_purchase WHERE userId = ? AND ntransactionId = ? AND purchase_type = ?"
        const params = [userId, ntransactionId, purchase_type]

        return new Promise((resolve, reject) => {
           this.pool.query(query, params, (error: QueryError | null, results: RowDataPacket[]) => {
                if(error){
                    console.log(error)
                    reject(error)
                }else{
                    resolve(results)
                }
            })
        })
    }
}

export default SinglePurchasedData