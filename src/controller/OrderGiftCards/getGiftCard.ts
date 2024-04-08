import { Request, Response } from "express";
import axios, { AxiosError, AxiosResponse } from "axios";
import myCache from "../../middleware/cache";

class OrderGiftCards {
  async OrderGiftcardsProducts(req: Request, res: Response): Promise<void> {
    const endpoint = "https://giftcards-sandbox.reloadly.com/orders";
    const {
      customIdentifier,
      productId,
      quantity,
      recipientEmail,
      countryCode,
      phoneNumber,
      senderName,
      unitPrice,
    } = req.body;
    const data = {
      customIdentifier,
      productId,
      quantity,
      recipientEmail,
      countryCode,
      phoneNumber,
      senderName,
      unitPrice,
    };
    try {
      const AuthKEY = myCache.get("AUTH_GIFTCARD_KEY");
      console.log("GGGG", AuthKEY);
      const response: AxiosResponse = await axios.post(endpoint, data, {
        headers: {
          Authorization: `Bearer ${AuthKEY}`,
          "Content-Type": "Application/json",
        },
      });
     
        res.status(200).json({success: response.data});
    
    } catch (error: any) {
      if (axios.isAxiosError(error)) {
        const axiosError = error as AxiosError;

        if (axiosError.response) {
          console.log(
            "Server response with a non-2xx status",
            axiosError.response
          );
          res
            .status(axiosError.response.status)
            .json({ axiosError: "Server Error in generating Airtime" });
        } else if (axiosError.request) {
          console.log("Server reequest Error ", axiosError.request.message);
          res
            .status(axiosError.request.status)
            .json({ axiosError: "Server Error 500" });
        } else {
          console.log("Server with status code 500", axiosError.message);
          res.status(500).json({ axiosError: "Internal Server error" });
        }
      } else {
        console.log("Internal server error", (error as Error).message);
        res.status(500).json({ error: "Internal server error" });
      }
    }
  }
}

export default OrderGiftCards;
