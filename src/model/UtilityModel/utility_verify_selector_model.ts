import { Pool, QueryError, RowDataPacket } from "mysql2";

class UtilityStatusSelector {
    private pool: Pool


    constructor(pool: Pool) {
        this.pool = pool
    }
    async checkStatus(): Promise<RowDataPacket[]> {
        const query = 'SELECT transactionId, userId FROM current_purchase WHERE status =? AND  transactionId IS NOT NULL'
        return new Promise((resolve, reject) => {
            this.pool.query(query, ["pending"], (error: QueryError | null, results: RowDataPacket[]) => {
                if (error) {
                    console.log(error)
                    reject(error)
                } else {
                    resolve(results)
                }
            })
        })
    }
    async updateStatus(tid: string, id: number): Promise<RowDataPacket[]> {
        const query = 'UPDATE current_purchase SET status = ?, success = ?  WHERE transactionId = ? AND userId = ?'
        return new Promise((resolve, reject) => {
            this.pool.query(query, ["successful", 1, tid, id], (error: QueryError | null, results: RowDataPacket[]) => {
                if (error) {
                    console.log(error)
                    reject(error)
                } else {
                    resolve(results)
                }
            })
        })
    }

}

export default UtilityStatusSelector