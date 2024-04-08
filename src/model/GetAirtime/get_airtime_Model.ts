import { Pool } from "mysql2/typings/mysql/lib/Pool";
import pool from "../../config/dbConfig";
import { QueryError, RowDataPacket } from "mysql2";


class AirtimeDataClass {
    private pool: Pool

    constructor(pool: Pool){
        this.pool = pool
    }
    async GetAirtimeModel(data: any): Promise<RowDataPacket[]>{
        const sql = 'UPDATE current_purchase SET transactionId = ?, success = 1 WHERE userId= ? ORDER BY time DESC LIMIT 1'
        const dataReq = [data.transactionId, data.userId]
       return new Promise((resolve, reject) => {
        this.pool.query(sql, dataReq, (error: QueryError | null, results: RowDataPacket[]) => {
            if(error){
                reject(error)
                console.log("error occured:", error)
            } else{
                resolve(results)
                console.log("finito")
            }
        })
       })
    } 
    async CHECKOTP(data: any): Promise<RowDataPacket[]> {

        const sql = "SELECT * FROM otp WHERE otp = ? and u_id = ?"
        const dataReq = [data.otp, data.userId]
        console.log(dataReq)
        return new Promise((resolve, reject) => {
            this.pool.query(sql, dataReq, (error: QueryError | null, results: RowDataPacket[]) => {
                if (error) {
                    reject(error)
                    console.log("Error found in request", error.message)
                } else {
                    resolve(results)
                    console.log("Successfully Checked data")
                }
            })
        })
    }
    
}

export default AirtimeDataClass