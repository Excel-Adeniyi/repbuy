import { QueryError, RowDataPacket } from "mysql2";
import { Pool } from "mysql2/typings/mysql/lib/Pool";


class CurrentPurchaseModel {
    private pool: Pool

    constructor(pool: Pool){
        this.pool = pool
    }

    async SelectCurrentPurchase(data: any): Promise<RowDataPacket[]>{
        const query = "SELECT id FROM user_access WHERE user_id = ?"
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
    async InsertPaymentTableModel(data: any): Promise<RowDataPacket[]>{
        const query = "INSERT INTO payment(user_id, purchase_id, accesscode, reference) SELECT userId, id, ? AS accesscode, ? As reference FROM current_purchase WHERE userId = ? ORDER BY time DESC LIMIT 1"
        const params = [data.accesscode, data.reference, data.userId]
        return new Promise((resolve, reject)=> {
            this.pool.query(
                query, params, (error: QueryError | null, results: RowDataPacket[]) => {
                    if(error){
                        reject(error);
                        console.log("Error Found in InsertPaymentTableModel", error.message);
                    }else{
                        resolve(results)
                        console.log(results)
                    }
                }
            )
        })
    }
    async UpdatePaymentTable(data: any): Promise<RowDataPacket []>{
        const query = "UPDATE payment SET successful=1, reference = ? WHERE user_id = ? and  accesscode = ?";
        const params = [data.reference, data.userId, data.accessCode];
        return new Promise((resolve, reject) => {
            this.pool.query(
                query, params, (error: QueryError | null, results: RowDataPacket[]) => {
                    if(error){
                        reject(error)
                        console.log("Error FOund in UpdatePaymentTable", error.message)
                    }else{
                        resolve(results)
                    }
                }
            )
        })
    }
}

export default CurrentPurchaseModel