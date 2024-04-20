import { Pool, QueryError, RowDataPacket } from "mysql2";


class SignupModel {
    private pool: Pool;

    constructor(pool: Pool) {
        this.pool = pool
    }
    async createUserModel(data: any): Promise<RowDataPacket[]> {
        const sql = "INSERT INTO user_account (first_name, last_name, email, country, phone_number, password, terms_n_condition) VALUES (?,?,?,?,?,?,?)"
        console.log(data)
    
        return new Promise((resolve, reject) => {
            this.pool.query(
                sql, [...Object.values(data)], (error: QueryError | null, results: RowDataPacket[]) => {
                    if (error) {
                        reject(error);
                        console.log("Error Found in GetSavedIOSModel", error.message);
                    } else {
                        resolve(results);
                        console.log("Successfully fetched data");
                    }
                }
            );
        });
    }
    async GoogleSignInModel(data: any): Promise<RowDataPacket[]> {
        const sql = "INSERT INTO user_account (first_name, email) VALUES (?,?)"
        console.log(data)
    
        return new Promise((resolve, reject) => {
            this.pool.query(
                sql, [...Object.values(data)], (error: QueryError | null, results: RowDataPacket[]) => {
                    if (error) {
                        reject(error);
                        console.log("Error Found in GetSavedIOSModel", error.message);
                    } else {
                        resolve(results);
                        console.log("Successfully fetched data");
                    }
                }
            );
        });
    }

    async checkGoogleModel(email: string): Promise<RowDataPacket[]> {
        const sql = "SELECT * FROM infoChecker WHERE email = ?"
        // console.log(data)
    
        return new Promise((resolve, reject) => {
            this.pool.query(
                sql, [email], (error: QueryError | null, results: RowDataPacket[]) => {
                    if (error) {
                        reject(error);
                        console.log("Error Found in GetSavedIOSModel", error.message);
                    } else {
                        resolve(results);
                        console.log(results);
                    }
                }
            );
        });
    }
    async checkUserModel(email: string, phone_number: any): Promise<RowDataPacket[]> {
        const sql = "SELECT email, phone_number,terms_n_condition FROM user_account WHERE email = ?  OR phone_number = ?"
        // console.log(data)
    
        return new Promise((resolve, reject) => {
            this.pool.query(
                sql, [email, phone_number], (error: QueryError | null, results: RowDataPacket[]) => {
                    if (error) {
                        reject(error);
                        console.log("Error Found in GetSavedIOSModel", error.message);
                    } else {
                        resolve(results);
                        console.log(results);
                    }
                }
            );
        });
    }
    async updateAvater(data: any): Promise<RowDataPacket[]>{
        const sql = "UPDATE user_account SET avatar = ? WHERE email = ?"
        const params = [data.userAvater, data.email]
        return new Promise((resolve, reject) => {
            this.pool.query(
                sql, params, (error: QueryError| null, results: RowDataPacket[])=> {
                    if (error) {
                        reject(error);
                        console.log("Error Found in GetSavedIOSModel", error.message);
                    } else {
                        resolve(results);
                        console.log(results);
                    }
                }
            )
        })
    }

    async userdata(data: any): Promise<RowDataPacket[]>{
        const sql = "SELECT id, first_name, last_name, email, country, phone_number, PASSWORD, terms_n_condition, date, avatar, verified, userpin  FROM user_account WHERE email = ? AND password = ?"
        const params = [data.email, data.password]
        return new Promise((resolve, reject) => {
            this.pool.query(
                sql, params, (error: QueryError| null, results: RowDataPacket[])=> {
                    if (error) {
                        reject(error);
                        console.log("Error Found in GetSavedIOSModel", error.message);
                    } else {
                        resolve(results);
                        console.log(results);
                    }
                }
            )
        })
    }
}

export default SignupModel