// Firebase Cloud Functions contoh. API key payment/PPOB taruh di environment, jangan di APK.
const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.createPayment = functions.https.onCall(async (data, context) => {
  if (!context.auth) throw new functions.https.HttpsError('unauthenticated', 'Login dulu');
  const amount = data.amount;
  // TODO: panggil API payment/PPOB di sini pakai process.env.PAYMENT_API_KEY
  const trx = await admin.firestore().collection('transactions').add({
    userId: context.auth.uid,
    amount,
    status: 'pending',
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
  });
  return { transactionId: trx.id, status: 'pending' };
});
