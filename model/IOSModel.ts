import { RowDataPacket, QueryError, Pool } from "mysql2";

class IOSModel {
  private pool: Pool;

  constructor(pool: Pool) {
    this.pool = pool;
  }

  async getIOSrecords(Jd: any): Promise<RowDataPacket[]> {
    const sql =
      "INSERT INTO ioscountries (extras) VALUES (?)";
    const extras = Jd;
    const values = [extras];

    return new Promise((resolve, reject) => {
      this.pool.query(
        sql,
        values,
        (error: QueryError | null, results: RowDataPacket[]) => {
          if (error) {
            reject(error);
            console.log("Error Found!", error);
          } else {
            resolve(results);
            console.log("Response from db", results);
          }
        }
      );
    });
  }
}

export default IOSModel;
