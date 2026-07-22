import admin from 'firebase-admin'
import { readFileSync } from 'fs'

// Path to the Firebase service account JSON — keep the file outside the repo
// and point to it via the environment (e.g. a Docker secret or mounted volume).
const serviceAccountPath = process.env.FIREBASE_SERVICE_ACCOUNT_PATH
if (!serviceAccountPath) {
    throw new Error('FIREBASE_SERVICE_ACCOUNT_PATH must point to the Firebase service account JSON')
}

const accountInfo: any = JSON.parse(readFileSync(serviceAccountPath, 'utf8'))
admin.initializeApp({
    credential: admin.credential.cert(accountInfo)
});
