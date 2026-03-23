import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color(0xFF00569E)), // Biru BCA
      home: const BcaHomeScreen(),
    );
  }
}

class BcaHomeScreen extends StatelessWidget {
  const BcaHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Definisi Warna Gradient BCA
    const Color blueBcaDark = Color(0xFF003D7C);
    const Color blueBcaLight = Color(0xFF006AC3);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- BAGIAN ATAS (GRADIENT + HEADER + SALDO + MENU) ---
            Container(
              padding: const EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
                bottom: 30,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [blueBcaDark, blueBcaLight],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // 1. Header (Logo & Icons)
                  _buildHeader(),
                  const SizedBox(height: 25),

                  // 2. Kartu Saldo
                  _buildBalanceCard(),
                  const SizedBox(height: 25),

                  // 3. Grid Menu
                  _buildMenuGrid(),
                ],
              ),
            ),

            // --- BAGIAN BAWAH (TRANSAKSI TERAKHIR) ---
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildTransactionHeader(),
                  const SizedBox(height: 15),
                  _buildTransactionList(),
                  const SizedBox(height: 25),
                  _buildSeeAllButton(),
                ],
              ),
            ),
          ],
        ),
      ),
      // --- BOTTOM NAVIGATION BAR (Sederhana) ---
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF00569E),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.compare_arrows), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ""),
        ],
      ),
    );
  }

  // --- WIDGET HELPER ---

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.account_balance, color: Colors.white, size: 28),
            const SizedBox(width: 8),
            const Text(
              "BCA",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.notifications_none, color: Colors.white, size: 24),
            SizedBox(width: 15),
            Icon(Icons.person_outline, color: Colors.white, size: 24),
          ],
        ),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15), // Semi-transparan
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.account_balance_wallet_outlined,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Saldo Rekening",
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
              SizedBox(height: 4),
              Text(
                "Rp 8.000.000",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuGrid() {
    final List<Map<String, dynamic>> menus = [
      {'icon': Icons.send_outlined, 'label': 'Transfer'},
      {'icon': Icons.credit_card_outlined, 'label': 'e-Card'},
      {'icon': Icons.add_card_outlined, 'label': 'Buka Rek.'},
      {'icon': Icons.swap_horiz_outlined, 'label': 'm-Transfer'},
      {'icon': Icons.info_outline, 'label': 'm-Info'},
      {'icon': Icons.receipt_long_outlined, 'label': 'm-Payment'},
      {'icon': Icons.shopping_cart_outlined, 'label': 'm-Commerce'},
      {'icon': Icons.qr_code_scanner_outlined, 'label': 'QRIS'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 15,
        crossAxisSpacing: 10,
        childAspectRatio: 0.85, // Mengatur tinggi menu
      ),
      itemCount: menus.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(menus[index]['icon'], color: Colors.white, size: 28),
            ),
            const SizedBox(height: 8),
            Text(
              menus[index]['label'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTransactionHeader() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Transaksi Terakhir",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    final List<Map<String, dynamic>> transactions = [
      {
        'icon': Icons.airplanemode_active,
        'label': 'Transfer ke Andi',
        'amount': '-Rp 150.000',
        'isMinus': true,
      },
      {
        'icon': Icons.phone_android,
        'label': 'Pembelian Pulsa',
        'amount': '-Rp 100.000',
        'isMinus': true,
      },
      {
        'icon': Icons.wallet_travel,
        'label': 'Isi Gopay',
        'amount': '+Rp 200.000',
        'isMinus': false,
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA), // Background abu sangat muda
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: transactions.length,
        separatorBuilder: (context, index) =>
            const Divider(color: Colors.black12, height: 1),
        itemBuilder: (context, index) {
          final trans = transactions[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFF00569E), // Biru ikon transaksi
                shape: BoxShape.circle,
              ),
              child: Icon(trans['icon'], color: Colors.white, size: 20),
            ),
            title: Text(
              trans['label'],
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            trailing: Text(
              trans['amount'],
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: trans['isMinus'] ? Colors.red : Colors.green,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSeeAllButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00569E),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
        ),
        child: const Text(
          "Lihat Semua",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
