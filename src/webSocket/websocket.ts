import { WebSocket, WebSocketServer } from "ws";
import handleId from "./handlers/handlemessage";
import websocketContext from "./handlers/sharecontext/websocketcontext";
import http from 'http'

interface sentMessage {
    service_type: string, biller_id: number, biller_name: string, user_id: number, pin_number: number, pin_unit: string
}

class WebSocketClass {
    wss: WebSocketServer
    users: any



    constructor(server: http.Server) {
        console.log("CHECKING VITALS 1")
        this.wss = new WebSocketServer({ noServer: true });

        // Correctly scope 'this' within the event handler
        console.log("CHECKING VITALS 2")
        server.on('upgrade', (request, socket, head) => {
            this.wss.handleUpgrade(request, socket, head, (ws) => {
                console.log("SOMETHING")
                this.wss.emit('connection', ws, request);
            });
        });
        console.log("CHECKING VITALS 3")
        this.setupWebsocket();
        console.log("CHECKING VITALS 4")
    }

    private setupWebsocket() {
        console.log("STARtING WEBSOCKET")
        this.wss.on('connection', (ws: WebSocket) => {
            ws.on("message", (message: any) => {
                try {
                    const data = JSON.parse(message)
                    console.log("WEBSOKETE", data)
                    const userId: any = data.userId
                    websocketContext.users[userId] = ws
                }
                catch (error) {
                    console.error(`Error handling message from 18:`, error);

                }
                // handleId(data, ws)
            })

            ws.on("close", () => {
                this.handleClose(ws)
            })
            ws.on('error', (error) => {
                console.error(`WebSocket error for user 18:`, error);
            });
        })
    }
    private handleClose(ws: WebSocket) {
        for (const userId in websocketContext.users) {
            if (websocketContext.users[userId] === ws) {
                delete websocketContext.users[userId];
                console.log(`User ${userId} disconnected`);
                break;
            }
        }
    }
    public sendToUser(userId: any, message: any): void {
        console.log("HERE")
        const userWs = websocketContext.users[userId]
        console.log("USER INFO DATA", userWs)

        if (userWs && userWs.readyState === WebSocket.OPEN) {
            console.log("MESSAGE DATA", message)
            const messageData = JSON.stringify(message)
            userWs.send(messageData)
        } else {
            
            console.log(`User ${userId} is not connected`);
        }
    }
}


export default WebSocketClass