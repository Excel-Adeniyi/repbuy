
import { WebSocket } from "ws"

interface websocketContextType {
    users: {[userId: string]: WebSocket}
}

const websocketContext: websocketContextType = {
    users: {}
}

export default websocketContext