import { QueryError, RowDataPacket } from "mysql2";
import { Pool } from "mysql2/typings/mysql/lib/Pool"



class HistoryModel {
    private pool: Pool;

    constructor(pool: Pool) {
        this.pool = pool
    }

    async History_Model(data: any): Promise<RowDataPacket[]> {
        const sql = 'INSERT INTO current_purchase (operatorId, amount, countryCode, number, userId, time) VALUES (?,?,?,?,?,?)'
        const dataReq = [data.operatorId, data.amount, data.countryCode, data.number, data.userId, data.timeData]
        return new Promise((resolve, reject) => {
            this.pool.query(
                sql, dataReq, (error: QueryError | null, results: RowDataPacket[]) => {
                    if (error) {
                        reject(error);
                        console.log("Error Found in GetSavedIOSModel", error.message);
                    } else {
                        resolve(results);
                        console.log("Successfully fetched data");
                    }
                }
            )
        })

    }
    async Update_History_Model(data: any): Promise<RowDataPacket[]> {
        const sql = 'UPDATE current_purchase SET transactionId = ?, success = 1 WHERE userId= ? ORDER BY time DESC LIMIT 1'
        const dataReq = [data.transactionId, data.userId]
        return new Promise((resolve, reject) => {
            this.pool.query(
                sql, dataReq, (error: QueryError | null, results: RowDataPacket[]) => {
                    if (error) {
                        reject(error);
                        console.log("Error Found in GetSavedIOSModel", error.message);
                    } else {
                        resolve(results);
                        console.log("Successfully fetched data");
                    }
                }
            )
        })

    }
}


export default HistoryModel