import { Pool, QueryError, RowDataPacket } from "mysql2"



class GiftcardUpdatePostPayent{
    private pool: Pool

    constructor(pool: Pool){
        this.pool = pool
    }


    async updateBothModel(data: any): Promise<RowDataPacket[]>{
        const query1 = "UPDATE current_purchase SET status = ?, success = ? WHERE ntransactionId = ? "
        const params = [...Object.values(data)]
       return new Promise((resolve, reject) => {
        this.pool.query(query1, params, (error: QueryError | null, results: RowDataPacket[]) => {
            if(error){
                console.log(error)
                reject(error)
            }else{
                resolve(results)
            }
        })
       })
    }
}

export default GiftcardUpdatePostPayent