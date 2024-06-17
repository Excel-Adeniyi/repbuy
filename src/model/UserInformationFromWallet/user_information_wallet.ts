import { Pool, RowDataPacket } from "mysql2/promise";


interface DataProps {
    userId: number,
    fullname_company: string,
    country: string,
    state: string,
    city: string,
    zipcode: string,
    address: string,
    created_at: Date,
    updated_at: Date
}
interface Data2Props {
    userId: number,
    updated_at: Date

}

class UserInformationWallet {

    private pool: Pool

    constructor(pool: Pool) {
        this.pool = pool
    }


    async submitInfo(data1: DataProps, data2: Data2Props): Promise<RowDataPacket[]> {
        const query1 = "INSERT INTO user_additional_details (userId, fullname_or_company, country, state, city, zipcode, address, created_at, updated_at) VALUES (?,?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE userId = VALUES(userId), fullname_or_company = VALUES(fullname_or_company), country = VALUES(country),city = VALUES(city), state = VALUES(state), zipcode = VALUES(zipcode), address = VALUES(address), updated_at = VALUES(updated_at)"
        const params1 = [...Object.values(data1)]
        const query2 = "UPDATE user_account SET user_information = 1, updated_at = ? WHERE id = ?"
        const params2 = [...Object.values(data2)]
        const connection = await this.pool.getConnection()
        try {


            await connection.beginTransaction()

            const [insertQuery]: any = await connection.query(query1, params1)
            if (insertQuery.affectedRows === 0) {
                throw new Error("Unable to store info data")
            }

            const [updateQuery]: any = await connection.query(query2, params2)

            if (updateQuery.affectedRows === 0) {
                throw new Error("Unable to update info data")
            }

            await connection.commit()

            return updateQuery as RowDataPacket[]
        } catch (error) {
            await connection.rollback()
            console.log(error)
            throw error
        } finally {
            await connection.release()
        }
    }
}

export default UserInformationWallet