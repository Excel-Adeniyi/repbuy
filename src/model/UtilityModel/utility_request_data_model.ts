import { Pool, QueryError, RowDataPacket } from "mysql2/promise"


class UtilityRequestData {
    private pool: Pool

    constructor(pool: Pool) {
        this.pool = pool
    }

    async UtilityRequestData(data: any): Promise<RowDataPacket[]> {
        const query = 'INSERT INTO utility_user_details (service_type, biller_id, biller_name, transactionId, user_id, pin_number, pin_unit ) VALUES(?,?,?,?,?,?,?) '
        const params = [data.service_type,
        data.biller_id,
        data.biller_name,
        data.transactionId,
        data.user_id,
        data.pin_number,
        data.pin_unit]

        const params2 = [data.user_id, data.transactionId]
        const query2 = 'SELECT ntransactionId, purchase_type, amount  FROM current_purchase WHERE userId = ? AND transactionId = ?'
        const connection = await this.pool.getConnection()
        try {
            await connection.beginTransaction()

            const [insertResult]: any = await connection.query(query, params)
            if (insertResult.affectedRows !== 1) {
                throw new Error('Insert operation failed, affectedRows')
            }

            const [rows]: any = await connection.query(query2, params2)

            await connection.commit()
            return rows as RowDataPacket[]
        } catch (error) {
            await connection.rollback()
            throw error
        } finally {
            connection.release()
        }
    }
}

export default UtilityRequestData