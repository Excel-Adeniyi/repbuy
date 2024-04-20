import { RowDataPacket } from "mysql2";
import { Pool } from "mysql2/typings/mysql/lib/Pool";


class Pincode{
    private model: Pool

    constructor (model: Pool){
        this.model = model
    }

    async PincodeModel(): Promise<RowDataPacket[]>{
        const query = "SELECT userp"
    }
}