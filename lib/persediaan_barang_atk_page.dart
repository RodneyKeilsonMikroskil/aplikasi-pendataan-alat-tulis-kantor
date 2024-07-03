import 'package:flutter/material.dart';

class PersediaanBarangATKPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const Text(
          'Persediaan Barang ATK',
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
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              
            },
          ),
        ],
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
            GestureDetector(onTap: () {Navigator.pushNamed(context, '/dashboard');}, child: ListTile(
              leading: const Icon(Icons.home),
              title: Text('Halaman Awal',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                  )),
            )),
            GestureDetector(onTap: () {Navigator.pushNamed(context, '/profile');}, child: ListTile(
              leading: const Icon(Icons.person),
              title: Text('Profil',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                  )),
            )),
            GestureDetector(onTap: () {Navigator.pushNamed(context, '/permintaanBarang');}, child: ListTile(
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
            GestureDetector(onTap: () {Navigator.pushNamed(context, '/tambahItem');}, child: ListTile(
              leading: const Icon(Icons.list),
              title: Text('Item ATK',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                  )),
            )),
            GestureDetector(onTap: () {Navigator.pushNamed(context, '/contact');}, child: ListTile(
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
                leading: Icon(Icons.exit_to_app),
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
          Expanded(
            child: ListView(
              children: [
                ItemRow(
                  title: 'Pulpen',
                  description: 'Boldliner',
                  amount: '100 Pcs',
                ),
                ItemRow(
                  title: 'Kertas A4',
                  description: 'Bola Dunia',
                  amount: '100 Rim',
                ),
                ItemRow(
                  title: 'Kertas F4',
                  description: 'Bola Dunia',
                  amount: '100 Rim',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.black.withOpacity(0.65),
                onPressed: () {},
                shape: const CircleBorder(),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemRow extends StatelessWidget {
  final String title;
  final String description;
  final String amount;

  ItemRow({
    required this.title,
    required this.description,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(
        description,
        style: TextStyle(color: Colors.grey[600]),
      ),
      trailing: Text(
        amount,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
