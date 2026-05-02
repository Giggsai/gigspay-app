firebase.initializeApp(firebaseConfig);
const auth = firebase.auth();
const db = firebase.firestore();

async function login(){
  await auth.signInWithEmailAndPassword(email.value, password.value);
  alert('Login admin berhasil');
}

async function saveSettings(){
  await db.collection('settings').doc('app').set({
    appName: appName.value || 'Gigspay',
    logoUrl: logoUrl.value || '',
    theme: theme.value,
    isMaintenance: maintenance.value === 'true',
    updatedAt: firebase.firestore.FieldValue.serverTimestamp()
  }, {merge:true});
  alert('Settings tersimpan');
}

async function resetPassword(){
  await auth.sendPasswordResetEmail(resetEmail.value);
  alert('Email reset password terkirim');
}

async function loadUsers(){
  const snap = await db.collection('users').limit(50).get();
  users.innerHTML = '';
  snap.forEach(doc => {
    const u = doc.data();
    users.innerHTML += `<p><b>${u.email || doc.id}</b><br>Saldo: ${u.balance || 0}</p>`;
  });
}
