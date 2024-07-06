import 'package:aplikasi_pendataan_alat_tulis_kantor/accountmodel.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/admin_dashboard_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/admin_pages/admin_home_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/admin_pages/admin_profile_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/admin_pages/admin_search_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/contact.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/dashboard_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/displaysettings.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/feedback.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/forgot_password_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/login_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/notifications.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/notificationsprovider.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/pengambilan_barang_atk.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/pengambilan_barang_atk_form.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/permintaan_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/permintaan_page_form.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/persediaan_barang_atk_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/persediaan_barang_atk_page_admin.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/profile.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/pengambilan_view_model.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/permintaan_view_model.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/persediaan_view_model.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/view_model.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/register_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/settings.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/tambah_barang_atk_admin.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/tambah_item_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RequestViewModel()),
        ChangeNotifierProvider(create: (_) => PermintaanViewModel()),
        ChangeNotifierProvider(create: (_) => PersediaanViewModel()),
        ChangeNotifierProvider(create: (_) => PengambilanViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NotificationsProvider()),
        ChangeNotifierProvider(create: (_) => AccountModel())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ATK Application',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness:
            Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
                ? Brightness.dark
                : Brightness.light,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/forgotPassword': (context) => const ForgotPasswordPage(),
        '/adminHome': (context) => const AdminDashboardHomePage(),
        '/adminProfile': (context) => const AdminDashboardProfilePage(),
        '/adminSearch': (context) => const AdminSearchPage(),
        '/adminDashboard': (context) => const AdminDashboardPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/persediaanBarang': (context) =>
            const PersediaanBarangATKPage(items: []),
        '/persediaanBarangAdmin': (context) =>
            const PersediaanBarangATKPageAdmin(items: []),
        '/tambahItem': (context) => const TambahItemATKPage(
              itemsv1: [],
            ),
        '/tambahBarangAdmin': (context) =>
            const TambahItemATKPageAdmin(itemsv1: []),
        '/permintaanBarang': (context) => const PermintaanPage(
              items: [],
            ),
        '/permintaanBarangForm': (context) => const PermintaanBarangForm(),
        '/pengambilanBarang': (context) => const PengambilanPage(
              items: [],
            ),
        '/pengambilanBarangForm': (context) => const PengambilanBarangForm(
              itemsv1: [],
            ),
        '/contact': (context) => const ContactPage(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => SettingsPage(),
        '/displaysettings': (context) => const DisplaySettingsPage(),
        '/notifications': (context) => const NotificationsPage(),
        '/feedback': (context) => const FeedbackPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
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
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: isDarkMode
                      ? const Color.fromARGB(255, 176, 176, 176)
                      : Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              child: Text('Skip......',
                  style: TextStyle(
                    color: isDarkMode
                        ? const Color.fromARGB(255, 176, 176, 176)
                        : Colors.blue,
                  )),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
