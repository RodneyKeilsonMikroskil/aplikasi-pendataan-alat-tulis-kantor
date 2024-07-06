import 'package:aplikasi_pendataan_alat_tulis_kantor/admin_pages/admin_home_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/admin_pages/admin_profile_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/admin_pages/admin_search_page.dart';

import 'package:flutter/material.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    AdminDashboardHomePage(),
    AdminSearchPage(),
    AdminDashboardProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const Text(
          'Aplikasi Data BMN ATK',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            _key.currentState!.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromARGB(255, 48, 47, 47)
            : Colors.black.withOpacity(0.6),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'logo-white.png',
                    height: 100,
                    width: 145,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Aplikasi Pendataan ATK',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text('Profil',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      )),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/contact');
                },
                child: ListTile(
                  leading: const Icon(Icons.contact_mail),
                  title: Text('Kontak',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      )),
                )),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: Text('Settings',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: Text('Keluar',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    )),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/dashboard');
              },
              child: ListTile(
                leading: const Icon(Icons.admin_panel_settings),
                title: Text('Login as User',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                    )),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
