function isEmpty(obj: any): boolean{
    console.log("ERE",obj)
    return Object.values(obj).length > 0 ;
}
export default isEmpty