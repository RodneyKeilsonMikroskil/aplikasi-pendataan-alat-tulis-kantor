import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(
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
          icon: Icon(
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
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset(
            'logo-color.png',
            height: 150,
            width: 185,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Container(
            height: 1.0,
            width: 250,
            color: Colors.red,
          ),
          const SizedBox(height: 10),
          Text(
            'Menu Data ATK',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.purple.withOpacity(0.55),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 1.0,
            width: 325,
            color: Colors.red,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1.5,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/persediaanBarang');
                      },
                      child: MenuButton(title: 'Persediaan\nBarang ATK')),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/tambahItem');
                      },
                      child: MenuButton(title: 'Tambah Item\nATK')),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/permintaanBarang');
                      },
                      child: MenuButton(title: 'Permintaan/\nPersetujuan ATK')),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/pengambilanBarang');
                      },
                      child: MenuButton(title: 'Pengambilan\nATK')),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/contact');
                      },
                      child: MenuButton(title: 'Contact')),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: MenuButton(title: 'Edit Profil')),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/tambahBarangAdmin');
                      },
                      child: MenuButton(title: 'Tambah Item ATK Admin')),
                  MenuButton(title: ''),
                  MenuButton(title: ''),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String title;

  MenuButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.85),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
