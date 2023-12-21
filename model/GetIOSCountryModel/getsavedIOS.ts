import { RowDataPacket, QueryError, Pool } from "mysql2";

class GETSavedIOSModel {
  private pool: Pool;

  constructor(pool: Pool) {
    this.pool = pool;
  }

  async getSavedIOSRecords(): Promise<RowDataPacket[]> {
    const sql = "SELECT * from ioscountries";
    return new Promise((resolve, reject) => {
      this.pool.query(
        sql,
        (error: QueryError | null, results: RowDataPacket[]) => {
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
}


export default GETSavedIOSModel