import 'package:aplikasi_pendataan_alat_tulis_kantor/list_model.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/pengambilan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PengambilanPage extends StatefulWidget {
  final List<ItemRow> items;

  const PengambilanPage({required this.items, super.key});

  @override
  _PengambilanPageState createState() => _PengambilanPageState();
}

class _PengambilanPageState extends State<PengambilanPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  void _showDialogTaken(BuildContext context, ItemRow item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Item Taken'),
          content: Text('${item.namaatk} has been taken.'),
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
          'Riwayat Persetujuan ATK',
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
      body: Consumer<PengambilanViewModel>(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.namaatk,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text('Jumlah: ${item.jumlah} ${item.satuan}'),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                _showDialogTaken(context, item);
                              },
                              child: const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
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