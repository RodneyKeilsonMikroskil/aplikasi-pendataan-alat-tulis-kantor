import 'package:aplikasi_pendataan_alat_tulis_kantor/contact.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/dashboard_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/forgot_password_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/login_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/pengambilan_barang_atk.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/permintaan_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/permintaan_page_2.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/persediaan_barang_atk_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/profile.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/register_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/tambah_barang_atk_admin.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/tambah_item_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ATK Application',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/forgotPassword': (context) => ForgotPasswordPage(),
        '/dashboard': (context) => DashboardPage(),
        '/persediaanBarang': (context) => PersediaanBarangATKPage(),
        '/tambahItem': (context) => TambahItemATKPage(),
        '/tambahBarangAdmin': (context) => TambahItemATKPageAdmin(),
        '/permintaanBarang': (context) => PermintaanPage(),
        '/permintaanBarang2': (context) => PermintaanBarangDuaPage(),
        '/pengambilanBarang': (context) => PengambilanBarang(),
        '/contact': (context) => ContactPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'logo-color.png',
              height: 150,
              width: 185,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Text(
              'Aplikasi Pendataan\nATK (Alat Tulis Kantor)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 1.0,
              width: 250,
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF333B45),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  )),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child:
                  const Text('REGISTER', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF333B45),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  )),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'LOGIN',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 1.0, // Adjust height for line thickness
              width: 325, // Expands to full width
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/forgotPassword');
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              child: const Text('Skip......',
                  style: TextStyle(color: Colors.blue)),
            ),
            const SizedBox(height: 20),
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
