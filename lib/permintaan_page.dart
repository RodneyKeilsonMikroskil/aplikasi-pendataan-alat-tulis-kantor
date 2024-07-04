import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/permintaan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/list_model.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/permintaan_page_form.dart';
import 'package:provider/provider.dart';

class PermintaanPage extends StatefulWidget {
  final List<RequestCard2> items;

  const PermintaanPage({required this.items, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PermintaanPageState createState() => _PermintaanPageState();
}

class _PermintaanPageState extends State<PermintaanPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void _showDialogSetuju() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Status: DITERIMA'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Catatan:"),
              Text(
                "Silakan dilanjutkan",
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDialogDitolak() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Status: DITOLAK'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Catatan:"),
              Text(
                "Terlalu Banyak Jumlahnya",
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const Text(
          'Permintaan Barang',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue.withOpacity(0.85),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _key.currentState!.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
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
            // Navigation menu items
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                'Halaman Awal',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/dashboard');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                'Profil',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text(
                'Form Permintaan',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/permintaanBarang');
              },
            ),
            ListTile(
              leading: const Icon(Icons.check_circle_outline),
              title: const Text(
                'Form Persetujuan',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/tambahItem');
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
              child: const ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text(
                  'Kontak',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: const ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  'Keluar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Consumer<PermintaanViewModel>(
        builder: (context, viewModel, child) {
          final items = viewModel.items;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.programstudi,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  item.quantity,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(item.tanggalpermintaan),
                                Row(
                                  children: [
                                    if (item.isCheckVisible)
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            item.isRemoveVisible = false;
                                          });
                                          _showDialogSetuju();
                                        },
                                        child: const Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        ),
                                      ),
                                    if (item.isRemoveVisible)
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            item.isCheckVisible = false;
                                          });
                                          _showDialogDitolak();
                                        },
                                        child: const Icon(
                                          Icons.remove_circle,
                                          color: Colors.red,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => const PermintaanBarangForm(),
      //       ),
      //     );
      //   },
      //   backgroundColor: Colors.blue,
      //   shape: const CircleBorder(),
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
