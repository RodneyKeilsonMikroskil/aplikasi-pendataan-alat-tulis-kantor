import 'package:aplikasi_pendataan_alat_tulis_kantor/dashboard_pages.dart/home_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/dashboard_pages.dart/profile_page.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/dashboard_pages.dart/search_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardHomePage(),
    SearchPage(),
    DashboardProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.blue.withOpacity(0.85),
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
        backgroundColor: Colors.black.withOpacity(0.6),
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
                  Navigator.pushNamed(context, '/dashboard');
                },
                child: ListTile(
                  leading: const Icon(Icons.home),
                  title: Text('Halaman Awal',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      )),
                )),
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
                  Navigator.pushNamed(context, '/permintaanBarang');
                },
                child: ListTile(
                  leading: const Icon(Icons.description),
                  title: Text('Form Permintaan',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      )),
                )),
            ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: Text('Form Persetujuan',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                  )),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/tambahItem');
                },
                child: ListTile(
                  leading: const Icon(Icons.list),
                  title: Text('Item ATK',
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
                Navigator.pushNamed(context, '/adminDashboard');
              },
              child: ListTile(
                leading: const Icon(Icons.admin_panel_settings),
                title: Text('Login as Admin',
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

class MenuButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const MenuButton({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.blue,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
