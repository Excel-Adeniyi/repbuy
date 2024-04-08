import { QueryError, RowDataPacket } from "mysql2";
import { Pool } from "mysql2/typings/mysql/lib/Pool";


class CurrentPurchaseModel {
    private pool: Pool

    constructor(pool: Pool){
        this.pool = pool
    }

    async SelectCurrentPurchase(data: any): Promise<RowDataPacket[]>{
        const query = "SELECT * FROM current_purchase WHERE userId = ? ORDER BY time DESC LIMIT 1"
        const params = [data.userId]
        return new Promise((resolve, reject)=> {
            this.pool.query(
                query, params, (error: QueryError | null, results: RowDataPacket[]) => {
                    if(error){
                        reject(error);
                        console.log("Error Found in GetSavedIOSModel", error.message);
                    }else{
                        resolve(results)
                        // console.log(results)
                    }
                }
            )
        })
    }
}

export default CurrentPurchaseModel