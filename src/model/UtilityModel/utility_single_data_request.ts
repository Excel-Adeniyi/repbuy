import { Pool, QueryError, RowDataPacket } from "mysql2";




class UtilitySingleDataRequest {
    private pool: Pool
    constructor(pool: Pool) {
        this.pool = pool
    }

    async singleData(userId: any, ntransactionId: any): Promise<RowDataPacket[]> {
        const query = 'SELECT current_purchase.amount, current_purchase.number, current_purchase.status, current_purchase.ntransactionId, utility_user_details.service_type, utility_user_details.biller_name, utility_user_details.pin_number FROM current_purchase INNER JOIN utility_user_details ON current_purchase.transactionId = utility_user_details.transactionId WHERE current_purchase.userId = ? AND current_purchase.ntransactionId = ? '
        const params = [userId, ntransactionId]
        return new Promise((resolve, reject ) => {
            this.pool.query(query, params, (error: QueryError | null, results : RowDataPacket[]) => {
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

export default UtilitySingleDataRequest