import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // ini aku pertahanin background gradient birunya, udah cakep!
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF0D47A1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // iconnya aku bungkus pakai lingkaran transparan dikit biar kesannya kayak logo beneran
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.15),
                ),
                child: const Icon(
                  Icons.task_alt,
                  size: 90,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 24),

              // ini nama aplikasi aku, dikasih jarak antar huruf (letterSpacing) dikit biar elegan
              const Text(
                "Planify",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 8),

              // tagline aplikasi
              const Text(
                "Organize Your Daily Life",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  letterSpacing: 0.5,
                ),
              ),

              const SizedBox(height: 50),

              // tombol Get Started aku permak ukurannya biar agak panjang dan gampang dipencet
              SizedBox(
                width: 220,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // background diubah putih biar kontras banget sama layar birunya
                    backgroundColor: Colors.white,
                    // warna tulisannya biru tua ngikutin gradient bawah
                    foregroundColor: const Color(0xFF0D47A1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ), // ujungnya aku bikin bulat banget
                    ),
                    elevation:
                        5, // aku kasih bayangan dikit biar tombolnya berasa "ngambang"
                  ),
                  onPressed: () {
                    // ubah jadi push biasa biar tombol back-nya muncul lagi di Home
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
