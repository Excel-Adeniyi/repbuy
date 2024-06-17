
import express, { Express } from 'express'
import cors from 'cors'
import { router } from './routes/httpRoute/routes';
import cookiePaser from 'cookie-parser'
import SessionData from './middleware/session';
import http from 'http'

import WebSocketClass from './webSocket/websocket';
import { startInterval } from './controller/ws/handleUtilityController';

const PORT = 2110
const app: Express = express();

let server: any = http.createServer(app)
const websocket = new WebSocketClass(server)

app.use(cors())
app.use(cookiePaser());
app.use(SessionData)

startInterval(websocket)
// //console.log("HI")
app.use(express.json())

app.use('/', router)
server.listen(PORT, () => { //console.log(`App Listening on ${PORT}`) })

