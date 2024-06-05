import { Pool, PoolConnection, RowDataPacket } from "mysql2/promise";

class FCMStorageModel {
    private pool: Pool

    constructor(pool: Pool) {
        this.pool = pool
    }

    async fcmstore(data: { id: number, f_token: string }): Promise<string | undefined> {
        const insertParams = [data.id, data.f_token]
        const updateParams = [data.f_token, data.id]
        let connection: PoolConnection | undefined
        const updateQuery = 'UPDATE fcm_token SET f_token = ? WHERE userid = ?'
        const insertQuery = 'INSERT INTO fcm_token (userid, f_token) VALUES (?, ?)'
        try {
            connection = await this.pool.getConnection();
            await connection.beginTransaction()

            const [rowcheck]: any = await connection.execute(updateQuery, updateParams)
            if ((rowcheck).affectedRows === 0) {
                await connection.execute(insertQuery, insertParams)
            }
            await connection.commit()
            return 'Token processed Successfully'
        } catch (error: any) {
            if (connection) {
                await connection.rollback()
                throw new Error(`Failed to process token: ${error.message}`);
            }
        } finally {
            if (connection) {
                connection.release()
            }
        }

    }
}

export default FCMStorageModel