/// <reference path="../types/session.d.ts" />
import csrf from 'csrf'

import { NextFunction, Request, Response } from 'express'

const tokens = new csrf()
const CsrfData = (req: Request ,res: Response, next: NextFunction ) => {
   // Generate a new CSRF secret
   try {
    const csrfSecret = tokens.secretSync();
    // Store the CSRF secret in the session
    req.session.csrfSecret = csrfSecret;
  
    // Generate a CSRF token for the current request
    const csrfToken = tokens.create(csrfSecret);
   //  console.log(csrfToken)
    // Make the CSRF token available in the response locals
    res.status(200).json({success: true, message: csrfToken})
  
    // Continue to the next middleware or route handler
    
   } catch (error) {
    console.log(error)
    
   }
 
}

export  default CsrfData;