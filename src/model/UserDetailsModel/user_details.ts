import { QueryError, RowDataPacket } from "mysql2";
import { Pool } from "mysql2/typings/mysql/lib/Pool";


class User_detailsMODEL{
    private pool:Pool

    constructor (pool: Pool){
        this.pool = pool
    }

    async  getUserDetails(userID: string): Promise<RowDataPacket[]>{
        const sql = "SELECT email from  user_account WHERE id=?" ;
        //console.log(userID)
        const dataReq = [userID]
        return new Promise((resolve, reject) => {
            this.pool.query(sql, dataReq, (error: QueryError | null, results: RowDataPacket[]) => {
                if(error){
                    //console.log("DB error in getting error", error)
                    reject(error)
                }else{
                    resolve(results);
                    //console.log("Succefully Fetched details")
                }
            })
        })
        

    }
}

export default  User_detailsMODEL;