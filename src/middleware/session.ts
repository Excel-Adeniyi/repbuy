import { Request, Response, NextFunction } from 'express';
import session from 'express-session';

const SessionData = (req: Request, res: Response, next: NextFunction) => {
  try {
    // console.log("CHECK SESSIon");
    session({
      secret: process.env.SESSION_SECRET || "sajdsjfkf3f39fkssajna0fk2@aokds923jka!jksd",
      resave: false,
      saveUninitialized: true,
      cookie: { secure: true }
    })(req, res, next); // Invoking the session middleware and passing req, res, and next
  } catch (error) {
    console.log(error);
    next(error); // Pass the error to the next middleware
  }
};

export default SessionData