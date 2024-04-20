import { Pool } from "mysql2/typings/mysql/lib/Pool";
import pool from "../../config/dbConfig";
import { QueryError, RowDataPacket } from "mysql2";


class AirtimeDataClass {
    private pool: Pool

    constructor(pool: Pool){
        this.pool = pool
    }
    async GetAirtimeModel(data: any): Promise<RowDataPacket[]>{
        const query = 'UPDATE current_purchase SET transactionId = ?, success = 1 WHERE userId= ? ORDER BY time DESC LIMIT 1'
        const params = [data.transactionId, data.userId]
       return new Promise((resolve, reject) => {
        this.pool.query(query, params, (error: QueryError | null, results: RowDataPacket[]) => {
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
    async CHECKSuccessful(data: any): Promise<RowDataPacket[]> {
        const query = 'SELECT successful, accesscode FROM payment WHERE user_id = ? ORDER BY id DESC LIMIT 1'
        const params = [data.userId];
        return new Promise((resolve, reject) => {
            this.pool.query(query, params, (error: QueryError | null, results: RowDataPacket[]) => {
                if (error){
                    reject(error)
                    console.log("Error found in CHECKSuccessful", error.message)
                }else{
                    resolve(results)
                    // console.log("Successfully recieved data", results)
                }
            })
        })
    }
    async CHECKOTP(data: any): Promise<RowDataPacket[]> {

        const query = "SELECT * FROM otp WHERE otp = ? and u_id = ?"
        const params = [data.otp, data.userId]
        // console.log(dataReq)
        return new Promise((resolve, reject) => {
            this.pool.query(query, params, (error: QueryError | null, results: RowDataPacket[]) => {
                if (error) {
                    reject(error)
                    console.log("Error found in request", error.message)
                } else {
                    resolve(results)
                    console.log("Successfully Checked data", results)
                }
            })
        })
    }
    
}

export default AirtimeDataClass