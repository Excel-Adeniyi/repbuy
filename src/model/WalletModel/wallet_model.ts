import { Pool, RowDataPacket } from "mysql2/promise"

interface walletProps {
    userId: number,
    current_balance: number,
    last_deposit_amount: number,
    total_overall_deposit: number,
    last_funded: number,
    created_at: number
}
interface currentPurchaseProps {
    //userID+method of payment
    operatorId: string,

    //last_deposti_amount
    amount: string,

    //currency_type
    countryCode: string,
    number: string,
    userId: number,
    time: string,
    ntransactionId: string,
    purchase_type: string,
    status: string



}

interface propsTypes {
    wallet: walletProps,
    currentPurchase: currentPurchaseProps
}
class WalletModel {
    private pool: Pool

    constructor(pool: Pool) {
        this.pool = pool
    }

    async saveToWallet(currentParams: propsTypes): Promise<RowDataPacket[]> {
        const { wallet, currentPurchase } = currentParams
        const query1 = "INSERT INTO user_wallet_balance (userId, current_balance, last_deposit_amount, total_overall_deposit, last_funded, created_at) VALUES (?,?,?,?,?,?) ON DUPLICATE KEY UPDATE userId = VALUES(userId), current_balance = VALUES(current_balance), last_deposit_amount = VALUES(last_deposit_amount), total_overall_deposit = VALUES(total_overall_deposit), last_funded = VALUES(last_funded), created_at = VALUES(created_at)"
        const params1 = [...Object.values(wallet)]

        const query2 = 'INSERT INTO current_purchase (operatorId, amount, countryCode, number, userId, time, ntransactionId, purchase_type, status ) VALUES (?,?,?,?,?,?,?,?,?)'
        const params2 = [...Object.values(currentPurchase)]

        const query3 = 'SELECT userId, current_balance, last_deposit_amount from user_wallet_balance WHERE userId = ?'
        const params3 = [wallet.userId]
        const connection = await this.pool.getConnection()

        try {
            await connection.beginTransaction()
            const [insertQuery1]: any = await connection.query(query1, params1)
            //check if the update or insert was successful
            if (insertQuery1.affectedRows !== 0) {
                throw new Error('Unable to save data');
            }

            const [insertQuery2]: any = await connection.query(query2, params2)
            //check if the insert into the current_purchase was successful
            if (insertQuery2.affectedRows !== 0) {
                throw new Error("Unable to save data to purchase")
            }

            const [rows]: any = await connection.query(query3, params3)
            if (rows.length > 0) {
                throw new Error("Unable to fetch data")
            }
            await connection.commit()

            return rows as RowDataPacket[]
        } catch (error) {
            await connection.rollback()
            console.log(error)
            throw error
        } finally {
            await connection.release()
        }
    }
}