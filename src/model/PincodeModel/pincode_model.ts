import { QueryError, RowDataPacket } from "mysql2";
import { Pool } from "mysql2/typings/mysql/lib/Pool";

interface ObjTypes{
    user_id: number,
    user_pin: number

}
class Pincode {
    private pool: Pool

    constructor(pool: Pool) {
        this.pool = pool
    }

    async PincodeModel(data: ObjTypes): Promise<RowDataPacket[]> {
        const query = "SELECT user_pin FROM user_access WHERE user_id  = ?"
        const params = [data.user_id]
        return new Promise((resolve, reject) => {
            this.pool.query(query, params, (error: QueryError | null, results: RowDataPacket[]) => {
                if (error) {
                    reject(error);
                    console.log("Error Found in GetSavedIOSModel", error.message);
                } else {
                    resolve(results)
                }
            })
        })
    }
}

export default Pincode