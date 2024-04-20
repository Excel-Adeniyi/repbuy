import { Request, Response } from "express";
import { ValueDigit } from "../../helper/randomDigit";
import nodemailer from 'nodemailer'
import OTPModel from "../../model/OTPModel/otp_model";
import HistoryModel from "../../model/HistoryModel/historyModel";
import User_detailsMODEL from "../../model/UserDetailsModel/user_details";

class OTPClass {
  private otpModel: OTPModel;


  // Define a private property for OTPModel

  constructor(otpModel: OTPModel) {

    this.otpModel = otpModel; // Initialize the OTPModel

  }

  async CreateHISTORYController(req: Request, res: Response): Promise<void> {

    try {
      const { email } = req.body
      // console.log(saleDetails)
      const digits = ValueDigit();
      const timeData = new Date()
      const userData = await this.otpModel.GetID(email)
      const userId = userData[0].id
      // const emailAdd = "Adeniyiexcel@gmail.com"
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
          console.log({ verifyTime, currentTime })
          if (otpDate == currentDate) {

            if (currentTime >= correctedTime) {

              const updateOtp = await this.otpModel.UPDATEOTP(otp_data)
              if (updateOtp != null && updateOtp != undefined) {


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
                    to: `${email}`, // list of receivers
                    subject: "noreply", // Subject line
                    // text: `${digits}`, // plain text body
                    html: `<body style='justify-content: center; padding-left: 15%; padding-right: 15%; padding-top: 10%;'><main style='display: flex; justify-content: center; text-align: center'><h1 style='color: purple; text-align: center'>Next Paypoint</h1></main><div><h4 style='text-align:center'>Email verification</h4><h5>Your OTP for Email Verification</h5><hr /><h3 style='color: aquamarine; font-weight: bold; background-color:rgb(53, 52, 51); text-align: center'>${digits}</h3><h4>kindly contact us if you have a complaint: <a href='mailto:support@nextpaypoint.com'>support@nextpaypoint.com</a></h6><h4>Regards,</h6><h4>Next Paypoint</h4></div></body>`, // html body
                  });

                  console.log("Message sent: %s", info.messageId);

                  // Message sent: <d786aa62-4e0a-070a-47ed-0b0666549519@ethereal.email>
                }

                main().catch(console.error);
              }
              res.status(200).json({ success: "true", message: `successfully sent to ${email}` })
            } else {
              res.status(200).json({ success: "false", message: "Kindly wait a little before retrying" })
            }
          } else {
            const updateOtp = await this.otpModel.UPDATEOTP(otp_data)
            if (updateOtp != null && updateOtp != undefined) {



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
                  to: `${email}`, // list of receivers
                  subject: "noreply", // Subject line
                  // text: `${digits}`, // plain text body
                  html: `<body style='justify-content: center; padding-left: 15%; padding-right: 15%; padding-top: 10%;'><main style='display: flex; justify-content: center; text-align: center'><h1 style='color: purple; text-align: center'>Next Paypoint</h1></main><div><h4 style='text-align:center'>Email verification</h4><h5>Your OTP for Email Verification</h5><hr /><h3 style='color: aquamarine; font-weight: bold; background-color:rgb(53, 52, 51); text-align: center'>${digits}</h3><h4>kindly contact us if you have a complaint: <a href='mailto:support@nextpaypoint.com'>support@nextpaypoint.com</a></h6><h4>Regards,</h6><h4>Next Paypoint</h4></div></body>`, // html body
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
          console.log()
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
              to: `${email}`,// list of receivers
              subject: "noreply", // Subject line
              // text: `${digits}`, // plain text body
              html: `<body style='justify-content: center; padding-left: 15%; padding-right: 15%; padding-top: 10%;'><main style='display: flex; justify-content: center; text-align: center'><h1 style='color: purple; text-align: center'>Next Paypoint</h1></main><div><h4 style='text-align:center'>Email verification</h4><h5>Your OTP for Email Verification</h5><hr /><h3 style='color: aquamarine; font-weight: bold; background-color:rgb(53, 52, 51); text-align: center'>${digits}</h3><h4>kindly contact us if you have a complaint: <a href='mailto:support@nextpaypoint.com'>support@nextpaypoint.com</a></h6><h4>Regards,</h6><h4>Next Paypoint</h4></div></body>`, // html body
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
  async recieveOTP(req: Request, res: Response): Promise<void> {
    const { otp, email } = req.body
    try {


      const userData = await this.otpModel.GetID(email)
      console.log(userData)
      const userId = userData[0].id
      console.log(userId)
      const data = {
        otp, email, userId
      }
      const otpCheck = await this.otpModel.CHECKOTP(data)

      const currentTime = new Date().getTime()
      if (otpCheck != null && otpCheck != undefined && otpCheck.length > 0 && otpCheck[0].otp == otp) {
        console.log(otpCheck)
        otpCheck.forEach(async (item) => {
          const otpTime = item.time
          const toUpdatedTime = new Date(otpTime.getTime() + (1 * 60 * 60 * 1000))
          const otpDate = otpTime.toLocaleDateString()
          const currentDate = new Date().toLocaleDateString()
          const verifyTime = new Date(toUpdatedTime.getTime() + ((60 * 60 * 1000) + (15 * 60 * 1000)))
          const correctedTime = verifyTime.getTime()
          console.log({ verifyTime, currentTime })
          if (otpDate == currentDate) {
            console.log({ otpDate, currentDate })
            if (currentTime <= correctedTime) {

              const response: any = await this.otpModel.VerifyEmail(userId)

              if (response.affectedRows = 1) {
                res.status(200).json({ success: true, message: "Email Verification Successful" })
              } else {
                res.status(500).json({ success: false, message: "Email Verification Unsuccessful" })
              }

            } else {
              console.log("HI", { currentTime, correctedTime })
              res.status(500).json({ success: false, message: "OTP Expired" })
            }
          } else {
            res.status(500).json({ success: false, message: "OTP Expired" })
          }
        })
      } else {
        res.status(500).json({ success: false, message: "Invalid OTP" })
      }
    } catch (error) {
      res.status(500).json({ success: false, message: "Internal Server error" })
    }
  }
  async pincode(req: Request, res: Response): Promise<void> {
    const { pincode, email } = req.body;
    try {
      const data = {
        pincode, email
      }
      const userData = await this.otpModel.GetID(email)
      if (userData[0].id !== undefined) {
        console.log(data)
        const user_id = userData[0].id
        const createUserPin: any = await this.otpModel.CreatePincode(user_id)
        if (createUserPin.affectedRows === 1) {
          const queryResponse: any = await this.otpModel.ValidatePincode(email)
          if (queryResponse.affectedRows === 1) {
            res.status(200).json({ success: true, message: "Pin Successfully Created" })
          } else {
            res.status(424).json({ success: false, message: "Unable to create pin " })
          }
        }

      }

    } catch (error) {
      res.status(500).json({ success: false, message: "Internal Server Error" })
    }

  }
}
export default OTPClass;