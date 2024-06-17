import { Request, Response, NextFunction } from 'express';
import * as sqlite3 from 'sqlite3'
import sqliteStoreFactory from 'express-session-sqlite'
import session from 'express-session';
import path from 'path'

const SessionData = (req: Request, res: Response, next: NextFunction) => {
  try {
    const SqliteStore = sqliteStoreFactory(session)
    // //console.log("CHECK SESSIon");
    const sessionMiddle = session({
      secret: process.env.SESSION_SECRET || "sajdsjfkf3f39fkssajna0fk2@aokds923jka!jksd",
      resave: false,
      saveUninitialized: true,
      cookie: { secure: false },
      store: new SqliteStore({
        // Database library to use. Any library is fine as long as the API is compatible
        // with sqlite3, such as sqlite3-offline
        driver: sqlite3.Database,
        // for in-memory database
        // path: ':memory:'
        path: path.join(__dirname, '/session.db'),
        // Session TTL in milliseconds
        ttl: 3600000,
        // (optional) Session id prefix. Default is no prefix.
        prefix: 'sess:',
        // (optional) Adjusts the cleanup timer in milliseconds for deleting expired session rows.
        // Default is 5 minutes.
        cleanupInterval: 300000,
        
      }),
    })
    
    return sessionMiddle(req, res, next); // Invoking the session middleware and passing req, res, and next
  } catch (error) {
    //console.log(error);
    next(error); // Pass the error to the next middleware
  }
};

export default SessionData