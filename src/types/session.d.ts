// session.d.ts

import { Session } from 'express-session';

declare module 'express-session' {
  interface Session {
    csrfSecret?: string;
    // Add other properties as needed
  }
}
