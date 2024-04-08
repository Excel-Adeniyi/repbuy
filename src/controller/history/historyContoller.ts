import { Request, Response } from "express";
import { ValueDigit } from "../../helper/randomDigit";
import nodemailer from 'nodemailer'
import OTPModel from "../../model/OTPModel/otp_model";
import HistoryModel from "../../model/HistoryModel/historyModel";
import User_detailsMODEL from "../../model/UserDetails/user_details";

class HistoryClass {
  private otpModel: OTPModel;
  private model: HistoryModel;
  private emailModel: User_detailsMODEL
  // Define a private property for OTPModel

  constructor(model: HistoryModel, otpModel: OTPModel, emailModel: User_detailsMODEL) {
    this.model = model;
    this.otpModel = otpModel; // Initialize the OTPModel
    this.emailModel = emailModel
  }

  async CreateHISTORYController(req: Request, res: Response): Promise<void> {

    try {
      const { operatorId, amount, recipientPhone, userId, order, provider } = req.body
      // console.log(saleDetails)
      const digits = ValueDigit();
      const timeData = new Date()
      const data = {
        operatorId, amount, countryCode: recipientPhone.countryCode, number: recipientPhone.number, timeData, userId
      }
      console.log( { operatorId, amount, recipientPhone, userId, order, provider })
      const otp_data = {
        digits, userId
      }
      const otpCheck = await this.otpModel.CHECKOTP(otp_data)

      const currentTime = new Date().getTime()
      if (otpCheck != null && otpCheck != undefined && otpCheck.length > 0) {
        console.log(otpCheck)
        otpCheck.forEach(async (item) => {
          const otpTime = item.time
          const toUpdatedTime = new Date(otpTime.getTime() + (1 * 60 * 60 * 1000))
          const otpDate = otpTime.toLocaleDateString()
          const currentDate = new Date().toLocaleDateString()
          const verifyTime = new Date(toUpdatedTime.getTime() + (2 * 60 * 1000))
          const correctedTime = verifyTime.getTime()
          console.log({verifyTime, currentTime})
          if (otpDate == currentDate) {
            console.log("@", {correctedTime, currentTime})
            if (currentTime >= correctedTime) {
              console.log("shaker",{correctedTime, currentTime})
              const updateOtp = await this.otpModel.UPDATEOTP(otp_data)
              if (updateOtp != null && updateOtp != undefined) {
                console.log("abito", {correctedTime, currentTime})
                const modelResult = await this.model.History_Model(data)
                const emailResult = await this.emailModel.getUserDetails(userId)
                console.log("EMAIL", emailResult)
                const emailAdd = emailResult[0].email
                console.log("KLL", emailAdd)
                const transporter = nodemailer.createTransport({
                  host: "mail.nextpaypoint.com",
                  port: 465,
                  secure: true, // Use `true` for port 465, `false` for all other ports
                  auth: {
                    user: "testmail@nextpaypoint.com",
                    pass: "checkmail123!@#",
                  },
                });

                // async..await is not allowed in global scope, must use a wrapper
                async function main() {
                  // send mail with defined transport object
                  const info = await transporter.sendMail({
                    from: '"Next Paypoint" <testmail@nextpaypoint.com>', // sender address
                    to: `${emailAdd}`, // list of receivers
                    subject: "noreply", // Subject line
                    // text: `${digits}`, // plain text body
                    html: `<body style='justify-content: center; padding-left: 15%; padding-right: 15%; padding-top: 10%;'> <main style='display: flex; justify-content: center; text-align: center'><h1 style='color: purple; text-align: center'>Next Paypoint</h1></main><div><h4 style='text-align:center'>Initiation of Payment</h4><p>This is to notify you that a transaction of <b>${data.amount}</b> is about to be made from your acount</p><hr/><p style="margin-top: 10px">Order: ${order}</p><p style="margin-top: 10px">Provider: ${provider}</p> <p>if you didn't initiate this payment kindly contact support for complaint support@netpaypoint.com</p> <h5>Your OTP to complete transaction initiation</h5><h3 style='color: aquamarine; font-weight: bold; background-color:rgb(53, 52, 51); text-align: center'>${digits}</h3><h4>kindly contact us if you have a complaint: <a href='mailto:support@nextpaypoint.com'>support@nextpaypoint.com</a></h6><h4>Regards,</h6><h4>Next Paypoint</h4></div></body>`, // html body
                  });

                  console.log("Message sent: %s", info.messageId);

                  // Message sent: <d786aa62-4e0a-070a-47ed-0b0666549519@ethereal.email>
                }

                main().catch(console.error);
              }
              res.status(200).json({ success: "true", message: "successfully sent" })
            } else {
              res.status(200).json({ success: "false", message: "Kindly wait a little before retrying" })
            }
          } else {
            const updateOtp = await this.otpModel.UPDATEOTP(otp_data)
            if (updateOtp != null && updateOtp != undefined) {
              const modelResult = await this.model.History_Model(data)
              const emailResult = await this.emailModel.getUserDetails(userId)
              console.log("EMAIL", emailResult)
              const emailAdd = emailResult[0].email
              console.log("KLL", emailAdd)
              const transporter = nodemailer.createTransport({
                host: "mail.nextpaypoint.com",
                port: 465,
                secure: true, // Use `true` for port 465, `false` for all other ports
                auth: {
                  user: "testmail@nextpaypoint.com",
                  pass: "checkmail123!@#",
                },
              });

              // async..await is not allowed in global scope, must use a wrapper
              async function main() {
                // send mail with defined transport object
                const info = await transporter.sendMail({
                  from: '"Next Paypoint" <testmail@nextpaypoint.com>', // sender address
                  to: `${emailAdd}`, // list of receivers
                  subject: "noreply", // Subject line
                  // text: `${digits}`, // plain text body
                  html: `<body style='justify-content: center; padding-left: 15%; padding-right: 15%; padding-top: 10%;'> <main style='display: flex; justify-content: center; text-align: center'><h1 style='color: purple; text-align: center'>Next Paypoint</h1></main><div><h4 style='text-align:center'>Initiation of Payment</h4><p>This is to notify you that a transaction of <b>${data.amount}</b> is about to be made from your acount</p><hr/><p style="margin-top: 10px">Order: ${order}</p><p style="margin-top: 10px">Provider: ${provider}</p> <p>if you didn't initiate this payment kindly contact support for complaint support@netpaypoint.com</p> <h5>Your OTP to complete transaction initiation</h5><h3 style='color: aquamarine; font-weight: bold; background-color:rgb(53, 52, 51); text-align: center'>${digits}</h3><h4>kindly contact us if you have a complaint: <a href='mailto:support@nextpaypoint.com'>support@nextpaypoint.com</a></h6><h4>Regards,</h6><h4>Next Paypoint</h4></div></body>`, // html body
                });

                console.log("Message sent: %s", info.messageId);

                // Message sent: <d786aa62-4e0a-070a-47ed-0b0666549519@ethereal.email>
              }

              main().catch(console.error);
            }
            res.status(200).json({ success: "true", message: "successfully sent" })
          }
        })

      } else {
        const storeOTP = await this.otpModel.OTPObj(otp_data)
        if (storeOTP !== undefined && storeOTP !== null) {
          const modelResult = await this.model.History_Model(data)
          const emailResult = await this.emailModel.getUserDetails(userId)
          console.log("EMAIL", emailResult)
          const emailAdd = emailResult[0].email
          console.log("KLL", emailAdd)
          const transporter = nodemailer.createTransport({
            host: "mail.nextpaypoint.com",
            port: 465,
            secure: true, // Use `true` for port 465, `false` for all other ports
            auth: {
              user: "testmail@nextpaypoint.com",
              pass: "checkmail123!@#",
            },
          });

          // async..await is not allowed in global scope, must use a wrapper
          async function main() {
            // send mail with defined transport object
            const info = await transporter.sendMail({
              from: '"Next Paypoint" <testmail@nextpaypoint.com>', // sender address
              to: `${emailAdd}`,// list of receivers
              subject: "noreply", // Subject line
              // text: `${digits}`, // plain text body
              html: `<body style='justify-content: center; padding-left: 15%; padding-right: 15%; padding-top: 10%;'> <main style='display: flex; justify-content: center; text-align: center'><h1 style='color: purple; text-align: center'>Next Paypoint</h1></main><div><h4 style='text-align:center'>Initiation of Payment</h4><p>This is to notify you that a transaction of <b>${data.amount}</b> is about to be made from your acount</p><hr/><p style="margin-top: 10px">Order: ${order}</p><p style="margin-top: 10px">Provider: ${provider}</p> <p>if you didn't initiate this payment kindly contact support for complaint support@netpaypoint.com</p> <h5>Your OTP to complete transaction initiation</h5><h3 style='color: aquamarine; font-weight: bold; background-color:rgb(53, 52, 51); text-align: center'>${digits}</h3><h4>kindly contact us if you have a complaint: <a href='mailto:support@nextpaypoint.com'>support@nextpaypoint.com</a></h6><h4>Regards,</h6><h4>Next Paypoint</h4></div></body>`, // html body
            });

            console.log("Message sent: %s", info.messageId);

            // Message sent: <d786aa62-4e0a-070a-47ed-0b0666549519@ethereal.email>
          }

          main().catch(console.error);
          res.status(200).json({ success: "true", message: "successfully sent" })
        }

      }

    } catch (error) {
      console.log(error)
      res.status(500).json("Internal Server Error")
    }

  }
  
}
export default HistoryClass;