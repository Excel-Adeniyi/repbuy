import pool from "../../../config/dbConfig";
import TransactionListController from "../../../controller/http/TransactionList/transaction_list";
import TransactionList from "../../../model/TransactionList/transaction_list";


const translistmodel = new TransactionList(pool)

const translistcontroller = new TransactionListController(translistmodel)

export default translistcontroller