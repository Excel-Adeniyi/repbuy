import { QueryError, RowDataPacket } from "mysql2";
import { Pool } from "mysql2/typings/mysql/lib/Pool";


class LoginModel {
    private pool: Pool;
    
    constructor(pool: Pool){
        this.pool = pool
    }

    async loginData(data: any): Promise<RowDataPacket[]>{
        const query = "SELECT * FROM user_account WHERE email = ? AND password = ?"
       const dataN = {
        email: data.userdata,
        password: data.password
       }
       console.log(dataN)
        return  new Promise((resolve, reject) =>{
            this.pool.query(
                query, [...Object.values(dataN)], (error: QueryError | null, results: RowDataPacket[]) => {
                    if (error) {
                        reject(error)
                    } else {
                        resolve(results);
                    }
                }
            )
        })
    }
    
    async loginMobileData(data: any): Promise<RowDataPacket[]>{
        const query = "SELECT id, first_name, last_name, email, country, phone_number, avatar, verified, userpin FROM user_account WHERE phone_number = ? AND password = ?"
        console.log(data)
       const dataN = {
        phone_number: data.userdata,
        password: data.password
       }
    //    console.log(dataN)
        return  new Promise((resolve, reject) =>{
            this.pool.query(
                query, [...Object.values(dataN)], (error: QueryError | null, results: RowDataPacket[]) => {
                    if (error) {
                        reject(error)
                    } else {
                        resolve(results);
                    }
                }
            )
        })
    }
}

export default LoginModel