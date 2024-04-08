"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const randomDigit_1 = require("../../helper/randomDigit");
const nodemailer_1 = __importDefault(require("nodemailer"));
class OTPClass {
    // Define a private property for OTPModel
    constructor(otpModel) {
        this.otpModel = otpModel; // Initialize the OTPModel
    }
    CreateHISTORYController(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const { email } = req.body;
                // console.log(saleDetails)
                const digits = (0, randomDigit_1.ValueDigit)();
                const timeData = new Date();
                const userData = yield this.otpModel.GetID(email);
                const userId = userData[0].id;
                // const emailAdd = "Adeniyiexcel@gmail.com"
                const otp_data = {
                    digits, userId
                };
                const otpCheck = yield this.otpModel.CHECKOTP(otp_data);
                const currentTime = new Date().getTime();
                if (otpCheck != null && otpCheck != undefined && otpCheck.length > 0) {
                    console.log(otpCheck);
                    otpCheck.forEach((item) => __awaiter(this, void 0, void 0, function* () {
                        const otpTime = item.time;
                        const toUpdatedTime = new Date(otpTime.getTime() + (1 * 60 * 60 * 1000));
                        const otpDate = otpTime.toLocaleDateString();
                        const currentDate = new Date().toLocaleDateString();
                        const verifyTime = new Date(toUpdatedTime.getTime() + (2 * 60 * 1000));
                        const correctedTime = verifyTime.getTime();
                        console.log({ verifyTime, currentTime });
                        if (otpDate == currentDate) {
                            if (currentTime >= correctedTime) {
                                const updateOtp = yield this.otpModel.UPDATEOTP(otp_data);
                                if (updateOtp != null && updateOtp != undefined) {
                                    const transporter = nodemailer_1.default.createTransport({
                                        host: "mail.nextpaypoint.com",
                                        port: 465,
                                        secure: true,
                                        auth: {
                                            user: "testmail@nextpaypoint.com",
                                            pass: "checkmail123!@#",
                                        },
                                    });
                                    // async..await is not allowed in global scope, must use a wrapper
                                    function main() {
                                        return __awaiter(this, void 0, void 0, function* () {
                                            // send mail with defined transport object
                                            const info = yield transporter.sendMail({
                                                from: '"Next Paypoint" <testmail@nextpaypoint.com>',
                                                to: `${email}`,
                                                subject: "noreply",
                                                // text: `${digits}`, // plain text body
                                                html: `<body style='justify-content: center; padding-left: 15%; padding-right: 15%; padding-top: 10%;'><main style='display: flex; justify-content: center; text-align: center'><h1 style='color: purple; text-align: center'>Next Paypoint</h1></main><div><h4 style='text-align:center'>Email verification</h4><h5>Your OTP for Email Verification</h5><hr /><h3 style='color: aquamarine; font-weight: bold; background-color:rgb(53, 52, 51); text-align: center'>${digits}</h3><h4>kindly contact us if you have a complaint: <a href='mailto:support@nextpaypoint.com'>support@nextpaypoint.com</a></h6><h4>Regards,</h6><h4>Next Paypoint</h4></div></body>`, // html body
                                            });
                                            console.log("Message sent: %s", info.messageId);
                                            // Message sent: <d786aa62-4e0a-070a-47ed-0b0666549519@ethereal.email>
                                        });
                                    }
                                    main().catch(console.error);
                                }
                                res.status(200).json({ success: "true", message: `successfully sent to ${email}` });
                            }
                            else {
                                res.status(200).json({ success: "false", message: "Kindly wait a little before retrying" });
                            }
                        }
                        else {
                            const updateOtp = yield this.otpModel.UPDATEOTP(otp_data);
                            if (updateOtp != null && updateOtp != undefined) {
                                const transporter = nodemailer_1.default.createTransport({
                                    host: "mail.nextpaypoint.com",
                                    port: 465,
                                    secure: true,
                                    auth: {
                                        user: "testmail@nextpaypoint.com",
                                        pass: "checkmail123!@#",
                                    },
                                });
                                // async..await is not allowed in global scope, must use a wrapper
                                function main() {
                                    return __awaiter(this, void 0, void 0, function* () {
                                        // send mail with defined transport object
                                        const info = yield transporter.sendMail({
                                            from: '"Next Paypoint" <testmail@nextpaypoint.com>',
                                            to: `${email}`,
                                            subject: "noreply",
                                            // text: `${digits}`, // plain text body
                                            html: `<body style='justify-content: center; padding-left: 15%; padding-right: 15%; padding-top: 10%;'><main style='display: flex; justify-content: center; text-align: center'><h1 style='color: purple; text-align: center'>Next Paypoint</h1></main><div><h4 style='text-align:center'>Email verification</h4><h5>Your OTP for Email Verification</h5><hr /><h3 style='color: aquamarine; font-weight: bold; background-color:rgb(53, 52, 51); text-align: center'>${digits}</h3><h4>kindly contact us if you have a complaint: <a href='mailto:support@nextpaypoint.com'>support@nextpaypoint.com</a></h6><h4>Regards,</h6><h4>Next Paypoint</h4></div></body>`, // html body
                                        });
                                        console.log("Message sent: %s", info.messageId);
                                        // Message sent: <d786aa62-4e0a-070a-47ed-0b0666549519@ethereal.email>
                                    });
                                }
                                main().catch(console.error);
                            }
                            res.status(200).json({ success: "true", message: "successfully sent" });
                        }
                    }));
                }
                else {
                    const storeOTP = yield this.otpModel.OTPObj(otp_data);
                    if (storeOTP !== undefined && storeOTP !== null) {
                        const transporter = nodemailer_1.default.createTransport({
                            host: "mail.nextpaypoint.com",
                            port: 465,
                            secure: true,
                            auth: {
                                user: "testmail@nextpaypoint.com",
                                pass: "checkmail123!@#",
                            },
                        });
                        // async..await is not allowed in global scope, must use a wrapper
                        function main() {
                            return __awaiter(this, void 0, void 0, function* () {
                                // send mail with defined transport object
                                const info = yield transporter.sendMail({
                                    from: '"Next Paypoint" <testmail@nextpaypoint.com>',
                                    to: `${email}`,
                                    subject: "noreply",
                                    // text: `${digits}`, // plain text body
                                    html: `<body style='justify-content: center; padding-left: 15%; padding-right: 15%; padding-top: 10%;'><main style='display: flex; justify-content: center; text-align: center'><h1 style='color: purple; text-align: center'>Next Paypoint</h1></main><div><h4 style='text-align:center'>Email verification</h4><h5>Your OTP for Email Verification</h5><hr /><h3 style='color: aquamarine; font-weight: bold; background-color:rgb(53, 52, 51); text-align: center'>${digits}</h3><h4>kindly contact us if you have a complaint: <a href='mailto:support@nextpaypoint.com'>support@nextpaypoint.com</a></h6><h4>Regards,</h6><h4>Next Paypoint</h4></div></body>`, // html body
                                });
                                console.log("Message sent: %s", info.messageId);
                                // Message sent: <d786aa62-4e0a-070a-47ed-0b0666549519@ethereal.email>
                            });
                        }
                        main().catch(console.error);
                        res.status(200).json({ success: "true", message: "successfully sent" });
                    }
                }
            }
            catch (error) {
                console.log(error);
                res.status(500).json("Internal Server Error");
            }
        });
    }
    recieveOTP(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { otp, email } = req.body;
            try {
                const userData = yield this.otpModel.GetID(email);
                const userId = userData[0].id;
                const data = {
                    otp, email, userId
                };
                const otpCheck = yield this.otpModel.CHECKOTP(data);
                const currentTime = new Date().getTime();
                if (otpCheck != null && otpCheck != undefined && otpCheck.length > 0 && otpCheck[0].otp == otp) {
                    console.log(otpCheck);
                    otpCheck.forEach((item) => __awaiter(this, void 0, void 0, function* () {
                        const otpTime = item.time;
                        const toUpdatedTime = new Date(otpTime.getTime() + (1 * 60 * 60 * 1000));
                        const otpDate = otpTime.toLocaleDateString();
                        const currentDate = new Date().toLocaleDateString();
                        const verifyTime = new Date(toUpdatedTime.getTime() + ((60 * 60 * 1000) + (15 * 60 * 1000)));
                        const correctedTime = verifyTime.getTime();
                        console.log({ verifyTime, currentTime });
                        if (otpDate == currentDate) {
                            console.log({ otpDate, currentDate });
                            if (currentTime <= correctedTime) {
                                const response = yield this.otpModel.VerifyEmail(userId);
                                if (response.affectedRows = 1) {
                                    res.status(200).json({ success: true, message: "Email Verification Successful" });
                                }
                                else {
                                    res.status(500).json({ success: false, message: "Email Verification Unsuccessful" });
                                }
                            }
                            else {
                                console.log("HI", { currentTime, correctedTime });
                                res.status(500).json({ success: false, message: "OTP Expired" });
                            }
                        }
                        else {
                            res.status(500).json({ success: false, message: "OTP Expired" });
                        }
                    }));
                }
                else {
                    res.status(500).json({ success: false, message: "Invalid OTP" });
                }
            }
            catch (error) {
                res.status(500).json({ success: false, message: "Internal Server error" });
            }
        });
    }
    pincode(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { pincode, email } = req.body;
            try {
                const data = {
                    pincode, email
                };
                console.log(data);
                const queryResponse = yield this.otpModel.CreatePincode(data);
                if (queryResponse.affectedRows = 1) {
                    res.status(200).json({ success: true, message: "Pin Successfully Created" });
                }
                else {
                    res.status(424).json({ success: false, message: "Unable to create pin " });
                }
            }
            catch (error) {
                res.status(500).json({ success: false, message: "Internal Server Error" });
            }
        });
    }
}
exports.default = OTPClass;
