# Gigspay Full Starter - Panduan HP

Isi paket:
- `app/` = Flutter app user Gigspay
- `admin/` = Admin panel web HTML sederhana
- `cloud-functions/` = contoh backend aman untuk payment/PPOB
- `.github/workflows/build-apk.yml` = build APK otomatis

## Cara edit di HP
Pakai aplikasi **Acode** atau **ZArchiver + Acode**.

### Edit UI app
- Nama, warna, menu: `app/lib/main.dart`
- Config Firebase: `app/lib/firebase_options.dart`

### Edit admin panel
- Tampilan admin: `admin/index.html`
- Logika admin: `admin/admin.js`
- Config Firebase admin: `admin/firebase-config.js`

### Edit payment/PPOB API
- Jangan taruh API key di Flutter app.
- Edit backend di: `cloud-functions/index.js`
- API key taruh di Firebase Functions config / environment.

## Upload ke GitHub dari Termux
Masuk folder hasil extract:
```bash
cd /sdcard/Download/gigspay_full_starter
```

Push ke repo lama:
```bash
git init
git config --global --add safe.directory /storage/emulated/0/Download/gigspay_full_starter
git add .
git commit -m "upload full Gigspay starter"
git branch -M main
git remote add origin https://github.com/Giggsai/gigspay-app.git
git push -u origin main --force
```

## Build APK
Buka GitHub → Actions → Build Gigspay APK → tunggu hijau → download Artifacts.

## Admin panel
Upload folder `admin/` ke hosting seperti Firebase Hosting, Netlify, atau GitHub Pages.
Sebelum dipakai, isi `admin/firebase-config.js` dengan config Firebase kamu.
