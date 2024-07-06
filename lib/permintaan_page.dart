import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/permintaan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/list_model.dart';
import 'package:provider/provider.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/persediaan_view_model.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/pengambilan_view_model.dart';

class PermintaanPage extends StatefulWidget {
  final List<RequestCard2> items;

  const PermintaanPage({required this.items, super.key});

  @override
  _PermintaanPageState createState() => _PermintaanPageState();
}

class _PermintaanPageState extends State<PermintaanPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void _showDialogSetuju(BuildContext context, RequestCard2 item) {
    final persediaanViewModel =
        Provider.of<PersediaanViewModel>(context, listen: false);
    final pengambilanViewModel =
        Provider.of<PengambilanViewModel>(context, listen: false);

    final itemIndex = persediaanViewModel.items
        .indexWhere((itemRow) => itemRow.namaatk == item.namaatk);

    if (itemIndex != -1) {
      final quantity = int.tryParse(item.quantity.split(' ')[0]);
      if (quantity != null) {
        final updatedItem = persediaanViewModel.items[itemIndex].copyWith(
          jumlah: (int.parse(persediaanViewModel.items[itemIndex].jumlah) -
                  quantity)
              .toString(),
        );
        persediaanViewModel.updateItem(itemIndex, updatedItem);

        pengambilanViewModel.addItem(ItemRow(
          kodeatk: persediaanViewModel.items[itemIndex].kodeatk,
          namaatk: item.namaatk,
          jenis: persediaanViewModel.items[itemIndex].jenis,
          jumlah: quantity.toString(),
          satuan: persediaanViewModel.items[itemIndex].satuan,
        ));

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
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text('Invalid Quantity'),
              content: Text("The provided quantity is invalid."),
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text('Item Not Found'),
            content: Text("Barang tidak tersedia."),
          );
        },
      );
    }
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
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
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
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
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
                                  item.namaatk,
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
                                          _showDialogSetuju(context, item);
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
    );
  }
}
