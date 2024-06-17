import { RowDataPacket, QueryError, Pool } from "mysql2";

class GETSavedIOSModel {
  private pool: Pool;

  constructor(pool: Pool) {
    this.pool = pool;
  }

  async getSavedIOSRecords(): Promise<RowDataPacket[]> {
    const sql = "SELECT * FROM ioscountries ORDER BY id DESC LIMIT 1";
    return new Promise((resolve, reject) => {
      this.pool.query(
        sql,
        (error: QueryError | null, results: RowDataPacket[]) => {
          if (error) {
            reject(error);
            //console.log("Error Found in GetSavedIOSModel", error.message);
          } else {
            resolve(results);
            //console.log("Successfully fetched data");
          }
        }
      );
    });
  }
}


export default GETSavedIOSModel