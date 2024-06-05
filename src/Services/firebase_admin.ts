
import admin from 'firebase-admin'
import serviceAccount from '../utilities/nexttellar-a5f1a-firebase-adminsdk-36lww-ff35eaf787.json'

const accountInfo: any = serviceAccount
admin.initializeApp({
    credential: admin.credential.cert(accountInfo)
});