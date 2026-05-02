import 'package:flutter/material.dart';

void main() => runApp(const GigspayApp());

class GigspayApp extends StatefulWidget {
  const GigspayApp({super.key});
  @override
  State<GigspayApp> createState() => _GigspayAppState();
}

class _GigspayAppState extends State<GigspayApp> {
  // Nantinya value ini diambil dari Firestore settings/app
  String appName = 'Gigspay';
  bool maintenance = false;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: darkMode ? ThemeData.dark(useMaterial3: true) : ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xFF2563EB)),
      home: maintenance ? MaintenancePage(appName: appName) : HomePage(appName: appName),
    );
  }
}

class HomePage extends StatelessWidget {
  final String appName;
  const HomePage({super.key, required this.appName});

  @override
  Widget build(BuildContext context) {
    final menus = [
      ['Pulsa', Icons.phone_android],
      ['Paket Data', Icons.signal_cellular_alt],
      ['PLN', Icons.flash_on],
      ['Topup Game', Icons.sports_esports],
      ['E-Wallet', Icons.account_balance_wallet],
      ['Riwayat', Icons.receipt_long],
    ];

    return Scaffold(
      appBar: AppBar(title: Text(appName), centerTitle: false),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF2563EB), Color(0xFF0F172A)]),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Saldo Anda', style: TextStyle(color: Colors.white70)),
              SizedBox(height: 8),
              Text('Rp 0', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Text('Pulsa • PPOB • Topup Game', style: TextStyle(color: Colors.white)),
            ]),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            itemCount: menus.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: .9, crossAxisSpacing: 12, mainAxisSpacing: 12),
            itemBuilder: (_, i) => Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OrderPage(title: menus[i][0] as String))),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(menus[i][1] as IconData, size: 32),
                  const SizedBox(height: 8),
                  Text(menus[i][0] as String, textAlign: TextAlign.center),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderPage extends StatelessWidget {
  final String title;
  const OrderPage({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(decoration: InputDecoration(labelText: title == 'Topup Game' ? 'User ID Game' : 'Nomor HP / ID Pelanggan', border: const OutlineInputBorder())),
          const SizedBox(height: 12),
          TextField(decoration: const InputDecoration(labelText: 'Nominal / Produk', border: OutlineInputBorder())),
          const SizedBox(height: 20),
          FilledButton(onPressed: () {}, child: const Text('Buat Transaksi')),
        ]),
      ),
    );
  }
}

class MaintenancePage extends StatelessWidget {
  final String appName;
  const MaintenancePage({super.key, required this.appName});
  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: Text('$appName sedang maintenance')));
}
