import { QueryError, RowDataPacket } from "mysql2";
import { Pool } from "mysql2/typings/mysql/lib/Pool";



class TransactionList{
    private pool: Pool

    constructor(pool: Pool){
        this.pool = pool
    }

    async getList(userId: string): Promise<RowDataPacket[]>{
        const query = 'SELECT amount, ntransactionId, updated_at, success, current_purchase.`status`, operatorId, countryCode, purchase_type  FROM current_purchase WHERE userId = ?  ORDER BY updated_at DESC LIMIT 30'
        const params = [userId]

        return new Promise((resolve, reject)=> {
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

export default TransactionList