import { QueryError, RowDataPacket } from "mysql2";
import { Pool } from "mysql2/typings/mysql/lib/Pool";



class UtilityTransactionSaver {
    private pool: Pool

    constructor(pool: Pool) {
        this.pool = pool
    }
    async storeTrans( resD: any,  ntransactionId: any, userid: any): Promise<RowDataPacket[]> {
        const query = 'UPDATE current_purchase SET transactionId = ? WHERE ntransactionId = ? AND userId = ? '
        const params = [resD, ntransactionId, userid]
        //console.log(params)
        return new Promise((resolve, reject) => {
            this.pool.query(
                query, params, (error: QueryError | null, results: RowDataPacket[]) => {
                    if (error) {
                        //console.log(error)
                        reject(error)
                    } else {
                        resolve(results)
                    }
                }
            )
        })
    }
}

export default UtilityTransactionSaver