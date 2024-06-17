import { QueryError, RowDataPacket } from "mysql2";
import { Pool } from "mysql2/typings/mysql/lib/Pool"


class OTPModel {
    private pool: Pool

    constructor(pool: Pool) {
        this.pool = pool;
    }
    async OTPObj(data: any): Promise<RowDataPacket[]> {

        const sql = "INSERT INTO otp (otp, u_id)  VALUES (?, ?)"
        const dataReq = [data.digits, data.userId]
        //console.log(dataReq)
        return new Promise((resolve, reject) => {
            this.pool.query(sql, dataReq, (error: QueryError | null, results: RowDataPacket[]) => {
                if (error) {
                    reject(error)
                    //console.log("Error found in request", error.message)
                } else {
                    resolve(results)
                    //console.log("Successfully recieved data")
                }
            })
        })
    }
    async GetID(email: string): Promise<RowDataPacket[]> {
        const sql = "SELECT id FROM user_account WHERE email = ?"
        return new Promise((resolve, reject) => {
            this.pool.query(sql, [email], (error: QueryError | null, results: RowDataPacket[]) => {
                if (error) {
                    reject(error)
                    //console.log("Error found in request", error.message)
                } else {
                    resolve(results)
                    //console.log("Successfully Checked data", results)
                }
            })
        })
    }
    async ValidatePincode(email: any): Promise<RowDataPacket[]> {
        const sql = "UPDATE user_account SET userpin = 1 WHERE email = ?"
        const payload = [email]
        //console.log(payload)
        return new Promise((resolve, reject) => {
            this.pool.query(sql, payload, (error: QueryError | null, results: RowDataPacket[]) => {
                if (error) {
                    reject(error)
                    //console.log("Error found in request", error.message)
                } else {
                    resolve(results)
                    //console.log("Successfully Checked data", results)
                }
            })
        })
    }
    async CreatePincode(data: any): Promise<RowDataPacket[]> {
        const sql = "INSERT INTO user_access (user_pin, user_id) Values (?,?) ON DUPLICATE KEY UPDATE  user_pin = VALUES (user_pin)"
        const payload = [data.pincode, data.user_id]
        //console.log(payload)
        return new Promise((resolve, reject) => {
            this.pool.query(sql, payload, (error: QueryError | null, results: RowDataPacket[]) => {
                if (error) {
                    reject(error)
                    //console.log("Error found in request", error.message)
                } else {
                    resolve(results)
                    //console.log("Successfully Checked data", results)
                }
            })
        })
    }
    async CHECKOTP(data: any): Promise<RowDataPacket[]> {

        const sql = "SELECT id, otp, u_id, time FROM otp WHERE u_id = ?"
        const dataReq = [data.userId]

        return new Promise((resolve, reject) => {
            this.pool.query(sql, dataReq, (error: QueryError | null, results: RowDataPacket[]) => {
                if (error) {
                    reject(error)
                    //console.log("Error found in request", error.message)
                } else {
                    resolve(results)
                    //console.log("Successfully Checked data")
                }
            })
        })
    }
    async VerifyEmail(id: any): Promise<RowDataPacket[]> {
        const sql = "UPDATE user_account SET verified = 1 WHERE id = ?"
        return new Promise((resolve, reject) => {
            this.pool.query(sql, [id], (error: QueryError | null, results: RowDataPacket[]) => {
                if (error) {
                    reject(error)
                    //console.log("Error found in request", error.message)
                } else {
                    resolve(results)
                    //console.log("Successfully Checked data", results)
                }
            })
        })
    }
    async UPDATEOTP(data: any): Promise<RowDataPacket[]> {

        const sql = "UPDATE otp SET otp=?, time=CURRENT_TIMESTAMP() WHERE u_id = ?"
        const dataReq = [data.digits, data.userId]

        return new Promise((resolve, reject) => {
            this.pool.query(sql, dataReq, (error: QueryError | null, results: RowDataPacket[]) => {
                if (error) {
                    reject(error)
                    //console.log("Error found in request", error.message)
                } else {
                    resolve(results)
                    //console.log("Successfully Checked data")
                }
            })
        })
    }
}

export default OTPModel