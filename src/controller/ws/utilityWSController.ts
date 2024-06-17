import { Request, Response } from "express";
import UtilityStatusSelector from "../../model/UtilityModel/utility_verify_selector_model";
import myCache from "../../middleware/cache";
import axios, { AxiosError } from "axios";
import UtilityRequestData from "../../model/UtilityModel/utility_request_data_model";
import WebSocketClass from "../../webSocket/websocket";



class VerifyPayment {

    private model: UtilityStatusSelector;
    private urdata: UtilityRequestData;
    private server: WebSocketClass;

    constructor(model: UtilityStatusSelector, urdata: UtilityRequestData, server: WebSocketClass) {
        this.model = model;
        this.urdata = urdata;
        this.server = server;
    }

    async verify(): Promise<void> {

        const cacheDb = myCache.get('AUTH_UTILITY_KEY')
        //console.log("AUTHHHHH", cacheDb)
        // //console.log("THE SERVER", this.server)
        try {
            const transactionStatus = await this.model.checkStatus()

            for (const tstatus of transactionStatus) {
                //console.log('THE TRANSACTION', tstatus.transactionId)
                const axiosInstance = axios.create()
                const responseVerify = await axiosInstance.get(`https://utilities-sandbox.reloadly.com/transactions/${tstatus.transactionId}`, {
                    headers: {
                        'Accept': 'application/com.reloadly.utilities-v1+json',
                        Authorization: `Bearer ${cacheDb}`
                    }
                })

                if (responseVerify.data.code === "PAYMENT_PROCESSED_SUCCESSFULLY" && responseVerify.data.code !== 'PAYMENT_PROCESSING_IN_PROGRESS') {
                    //console.log("THE TOKEN", responseVerify.data.transaction.billDetails.pinDetails)
                    const verifiedPayload = {
                        type: 'Electric',
                        code: responseVerify.data.code,
                        service_type: responseVerify.data.transaction.billDetails.serviceType,
                        biller_id: responseVerify.data.transaction.billDetails.billerId,
                        biller_name: responseVerify.data.transaction.billDetails.billerName,
                        transactionId: responseVerify.data.transaction.id,
                        user_id: tstatus.userId,
                        pin_number: responseVerify.data.transaction.billDetails.pinDetails?.token || null,
                        pin_unit: responseVerify.data.transaction.billDetails.pinDetails?.info1 || null,
                    }
                    this.model.updateStatus(tstatus.transactionId, tstatus.userId)
                    if (verifiedPayload.transactionId !== undefined && verifiedPayload.transactionId !== null) {
                        const storeData: any = await this.urdata.UtilityRequestData(verifiedPayload)
                        //console.log('THE STORED DATA', storeData)
                      
                        if (storeData.length > 0 ) {
                            
                            this.server.sendToUser(tstatus.userId, storeData)
                        }
                    }


                }
                //console.log('Checker', responseVerify.data)
            }

        } catch (error: any) {
            if (axios.isAxiosError(error)) {
                const axiosError = error as AxiosError

                if (axiosError.response) {
                    const responseData = axiosError.response.data as ({ message: string })
                    //console.log('Response Error', responseData)
                    // res.status(503).json({ Success: false, message: "Unable to get response" })
                } else if (axiosError.request) {
                    const requestData = axiosError.request.data as ({ message: string })
                    //console.log('Request Error', requestData)
                    // res.status(500).json({ Success: false, message: "Unable to make request" })
                } else {
                    // res.status(500).json({ Success: false, message: "Internal error has occured" })
                }
            } else {
                //console.log(error)
                // res.status(500).json({ Success: false, message: "Internal Server error" })
            }
        }
    }


}

// Instantiate your dependencies
export default VerifyPayment