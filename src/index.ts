
import express, { Express } from 'express'
import cors from 'cors'
import { router } from './routes/httpRoute/routes';
import cookiePaser from 'cookie-parser'
import SessionData from './middleware/session';
import http from 'http'
import { WebSocketServer } from 'ws';

const PORT = 2110
const app: Express = express();

let server: any = http.createServer( app)
let wss = new WebSocketServer({server})
const wsPORT = process.env.PORT || 8080

app.use(cors())
app.use(cookiePaser());
app.use(SessionData)
// console.log("HI")
app.use(express.json())

app.use('/', router)
app.listen(PORT, () => { console.log(`App Listening on ${PORT}`) })

server.listen(wsPORT,() => {
    console.log("WebSocket Listening on PORT:", wsPORT)
} )