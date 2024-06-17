import csrf from 'csrf';
import { NextFunction, Request, Response } from 'express';

const tokens = new csrf();

const CsrfData = (req: Request, res: Response, next: NextFunction) => {
   try {
      //console.log("Request body:", req.body);

      const { csptoken } = req.body;

      if (csptoken === process.env.CSRFREQUESTER) {
         if (!req.session.csrfSecret) {
            const csrfSecret = tokens.secretSync();
            req.session.csrfSecret = csrfSecret;
            //console.log("CSRF Secret generated and stored:", csrfSecret);
         }

         const csrfToken = tokens.create(req.session.csrfSecret);
         //console.log("CSRF Token generated:", csrfToken);
         return res.status(200).json({ success: true, message: csrfToken });
      } 
   } catch (error) {
      console.error("Error in CSRF middleware:", error);
      res.status(500).json({ success: false, message: "Internal Server Error" });
   }
};

export default CsrfData;
