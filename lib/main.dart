import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color(0xFF00529C)),
      home: const BriHomeScreen(),
    );
  }
}

class BriHomeScreen extends StatelessWidget {
  const BriHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900], // Background biru tua khas BRImo
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Selamat Pagi, Afifatul",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        actions: const [
          Icon(Icons.help_outline, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.notifications_none, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white, // Bagian bawah berwarna putih
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // --- KARTU SALDO ---
              _buildBalanceCard(),
              const SizedBox(height: 25),

              // --- GRID MENU ---
              _buildMenuGrid(),
              const SizedBox(height: 25),

              // --- BANNER PROMO ---
              _buildPromoBanner(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF00529C),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Riwayat"),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: "QRIS",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Akun",
          ),
        ],
      ),
    );
  }

  // Widget Kartu Saldo
  Widget _buildBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF00529C),
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: NetworkImage(
            'https://www.transparenttextures.com/patterns/cubes.png',
          ), // Tekstur kartu
          opacity: 0.1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Saldo Rekening", style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Rp 1.234.567",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.visibility_off, color: Colors.white70),
            ],
          ),
          const Divider(color: Colors.white24, height: 30),
          const Text(
            "Nomor Rekening: 1234-01-000123-50-1",
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  // Widget Menu (Grid 4 Kolom)
  Widget _buildMenuGrid() {
    final List<Map<String, dynamic>> menus = [
      {'icon': Icons.swap_horiz, 'label': 'Transfer'},
      {'icon': Icons.account_balance_wallet, 'label': 'Dompet Digital'},
      {'icon': Icons.receipt_long, 'label': 'BRIVA'},
      {'icon': Icons.phone_android, 'label': 'Pulsa/Data'},
      {'icon': Icons.bolt, 'label': 'Listrik'},
      {'icon': Icons.credit_card, 'label': 'Kartu Kredit'},
      {'icon': Icons.confirmation_number, 'label': 'Beli Tiket'},
      {'icon': Icons.grid_view, 'label': 'Lainnya'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 20,
      ),
      itemCount: menus.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                shape: BoxShape.circle,
              ),
              child: Icon(menus[index]['icon'], color: const Color(0xFF00529C)),
            ),
            const SizedBox(height: 8),
            Text(
              menus[index]['label'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.orange[100],
      ),
      child: const Center(
        child: Text(
          "Promo Spesial Untukmu!",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
