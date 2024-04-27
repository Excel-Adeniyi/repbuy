import { QueryError, RowDataPacket } from "mysql2";
import { Pool } from "mysql2/typings/mysql/lib/Pool";


class UtilityPurchase{
    private pool:Pool


    constructor(pool: Pool){
        this.pool = pool
    }

    async utilityPurchaseModel(data: any): Promise<RowDataPacket[]>{

        const query = "INSERT INTO current_purchase (operatorId, amount, countryCode, number,purchase_type, status) VALUES (?,?,?,?,?,?)"
        return new Promise((resolve, reject) => {
            this.pool.query(
                query, (error: QueryError | null, results: RowDataPacket[]) =>{
                    if(error){
                        console.log(error)
                        reject(error)
                    }else{
                        resolve(results)
                    }
                }
            )
        }) 
    }
}

export default UtilityPurchase