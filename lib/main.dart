import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BriHomeScreen(),
    );
  }
}

class BriHomeScreen extends StatelessWidget {
  const BriHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00529C), // Background Biru BRI
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Selamat Pagi, Afifatul",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        actions: const [
          Icon(Icons.help_outline, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.notifications_none, color: Colors.white),
          SizedBox(width: 15),
        ],
      ),
      body: Stack(
        children: [
          // Bagian Putih di Bawah yang Melengkung
          Container(
            margin: const EdgeInsets.only(top: 100),
            decoration: const BoxDecoration(
              color: Color(0xFFF5F6F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
          // Isi Konten
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildBalanceCard(),
                const SizedBox(height: 25),
                _buildMenuGrid(),
                const SizedBox(height: 25),
                _buildPromoBanner(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF00529C),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Mutasi"),
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

  Widget _buildBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Saldo Rekening",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Text(
                "Rp 1.234.567",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00529C),
                ),
              ),
            ],
          ),
          const Icon(Icons.visibility_off, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildMenuGrid() {
    final List<Map<String, dynamic>> menus = [
      {'icon': Icons.swap_horiz, 'label': 'Transfer'},
      {'icon': Icons.account_balance_wallet, 'label': 'Dompet Digital'},
      {'icon': Icons.receipt_long, 'label': 'BRIVA'},
      {'icon': Icons.phone_android, 'label': 'Pulsa/Data'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: menus.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFE3F2FD),
              child: Icon(menus[index]['icon'], color: const Color(0xFF00529C)),
            ),
            const SizedBox(height: 8),
            Text(
              menus[index]['label'],
              style: const TextStyle(fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue[100],
      ),
      child: const Center(child: Text("Promo BRImo Terbaru")),
    );
  }
}
