import { QueryError, RowDataPacket } from "mysql2";
import { Pool } from "mysql2/typings/mysql/lib/Pool";



class CurrentWalletBalanceModel{
    private pool: Pool

    constructor(pool: Pool){
        this.pool = pool
    }

    async getbalance(userId: string): Promise<RowDataPacket[]>{
        const query = "SELECT last_deposit_amount, current_balance, total_overall_deposit FROM user_wallet_balance WHERE userid = ?"
        const params = [userId]

        return new Promise((resolve, reject) => {
            this.pool.query(query, params, (error: QueryError | null, results: RowDataPacket[]) => {
                if(error){
                    console.log("ERROR IN CURRENT WALLET BALANCE MODEl", error)
                    reject(error)
                }else {
                    resolve(results)
                }
            })
        })
    }
}

export default CurrentWalletBalanceModel