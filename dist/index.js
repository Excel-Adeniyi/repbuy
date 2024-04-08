"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const routes_1 = require("./routes/routes");
const cookie_parser_1 = __importDefault(require("cookie-parser"));
const PORT = 2110;
const app = (0, express_1.default)();
app.use((0, cors_1.default)());
app.use((0, cookie_parser_1.default)());
// app.use(SessionData)
// console.log("HI")
app.use(express_1.default.json());
app.use('/', routes_1.router);
app.listen(PORT, () => { console.log(`App Listening on ${PORT}`); });
