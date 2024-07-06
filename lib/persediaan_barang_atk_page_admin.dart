import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/persediaan_view_model.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/tambah_barang_atk_admin.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/list_model.dart';
import 'package:provider/provider.dart';

class PersediaanBarangATKPageAdmin extends StatefulWidget {
  final List<ItemRow> items;
  const PersediaanBarangATKPageAdmin({required this.items, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PersediaanBarangATKState createState() => _PersediaanBarangATKState();
}

class _PersediaanBarangATKState extends State<PersediaanBarangATKPageAdmin> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
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
      body: Consumer<PersediaanViewModel>(builder: (context, viewModel, child) {
        final items = viewModel.items;
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    title: Text(item.namaatk),
                    subtitle: Text(
                      item.jenis,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    trailing: Text(
                      '${item.jumlah} ${item.satuan}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Align(
            //     alignment: Alignment.bottomRight,
            //     child: FloatingActionButton(
            //       backgroundColor: Colors.black.withOpacity(0.65),
            //       onPressed: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => MakeItems(
            //                       itemsv1: widget.items,
            //                     )));
            //       },
            //       shape: const CircleBorder(),
            //       child: const Icon(Icons.add, color: Colors.white),
            //     ),
            //   ),
            // ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blue,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MakeItems(
                        itemsv1: widget.items,
                      )));
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
