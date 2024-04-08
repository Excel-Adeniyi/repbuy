
import express, { Express } from 'express'
import cors from 'cors'
import { router } from './routes/routes';
import cookiePaser from 'cookie-parser'
import SessionData from './middleware/session';
const PORT = 2110
const app: Express = express();
app.use(cors())
app.use(cookiePaser());
// app.use(SessionData)
// console.log("HI")
app.use(express.json())

app.use('/', router)
app.listen(PORT, () => { console.log(`App Listening on ${PORT}`) })