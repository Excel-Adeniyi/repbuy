import { Pool, RowDataPacket } from "mysql2/promise";


class GiftCardSaveBeforePaymentModel {
    private pool: Pool

    constructor(pool: Pool) {
        this.pool = pool;
    }

    async firstSave(data1: any, data2: any, data3: any): Promise<RowDataPacket[]> {

        const query1 = "INSERT INTO current_purchase (operatorId, amount, countryCode, number, userId, time, ntransactionId, purchase_type, status) VALUES (?,?,?,?,?, CURDATE(), ?, ?,'pending')"
        const params1 = [...Object.values(data1)]

        const query2 = "INSERT INTO giftcard_end_user (userId, transaction_id_customer_id, recipient_email, recipient_phone, country_code, quantity, unit_price) VALUES (?,?,?,?,?,?,?)"
        const params2 = [...Object.values(data2)]

        const query3 = "SELECT ntransactionId FROM  current_purchase WHERE ntransactionId = ?"
        const params3 = [...Object.values(data3)]

        const connection = await this.pool.getConnection()
        try {
            await connection.beginTransaction()
            const [insertQuery]: any = await connection.query(query1, params1)

            if (insertQuery.affectedRows !== 1) {
                throw new Error('Insert operation failed, current_purchase for giftcard insertion')
            }

            const [insert2]: any = await connection.query(query2, params2)
            if (insert2.affectedRows !== 1) {
                throw new Error('Insert Operation failed, giftcard_end_user for giftcard insertion')
            }

            const [row] = await connection.query(query3, params3)
            await connection.commit()
            return row as RowDataPacket[]
        } catch (error) {
            await connection.rollback()
            throw error
        } finally {
            connection.release()
        }
    }
}


export default GiftCardSaveBeforePaymentModel