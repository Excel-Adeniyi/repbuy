import websocketContext from "../sharecontext/websocketcontext"
import { WebSocket } from "ws";

interface RegisterMessage {
    type: "register";
    userId: string;
}


function handleStoreId(data: RegisterMessage, ws: WebSocket) {
   

    
    // //console.log('USER id connected:', userId)
}

export default handleStoreId