import handleStoreId from "./SwitchFunction/handle_store_userid"



function handleId(data: any, ws: any){
    switch(data.type){
        case "register":
            handleStoreId(data, ws)
    }
}

export default handleId