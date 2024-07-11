import 'package:flutter/material.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/list_model.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/persediaan_view_model.dart';
import 'package:provider/provider.dart';

class MakeItems extends StatelessWidget {
  final List<ItemRow> itemsv1;
  const MakeItems({required this.itemsv1, super.key});

  @override
  Widget build(BuildContext context) {
    return TambahItemATKPageAdmin(
      itemsv1: itemsv1,
    );
  }
}

class TambahItemATKPageAdmin extends StatefulWidget {
  final List<ItemRow> itemsv1;
  const TambahItemATKPageAdmin({required this.itemsv1, super.key});

  @override
  State<TambahItemATKPageAdmin> createState() => _TambahItemATKPageAdminState();
}

class _TambahItemATKPageAdminState extends State<TambahItemATKPageAdmin> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  String _selectedUnit = '--- PILIH SATUAN ---';
  final TextEditingController kodeatk = TextEditingController();
  final TextEditingController namaatk = TextEditingController();
  final TextEditingController jenis = TextEditingController();
  final TextEditingController jumlah = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
        key: _key,
        appBar: AppBar(
          title: const Text(
            'Tambah Item ATK',
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
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body:
            Consumer<PersediaanViewModel>(builder: (context, viewModel, child) {
          return Center(
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                TextField(
                  controller: kodeatk,
                  decoration: const InputDecoration(
                      constraints: BoxConstraints(maxWidth: 375.0),
                      labelText: 'Kode ATK'),
                ),
                TextField(
                  controller: namaatk,
                  decoration: const InputDecoration(
                      constraints: BoxConstraints(maxWidth: 375.0),
                      labelText: 'Nama ATK'),
                ),
                TextField(
                  controller: jenis,
                  decoration: const InputDecoration(
                      constraints: BoxConstraints(maxWidth: 375.0),
                      labelText: 'Jenis'),
                ),
                TextField(
                  controller: jumlah,
                  decoration: const InputDecoration(
                      constraints: BoxConstraints(maxWidth: 375.0),
                      labelText: 'Jumlah'),
                ),
                DropdownButton<String>(
                  value: _selectedUnit,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedUnit = newValue!;
                    });
                  },
                  items: <String>['--- PILIH SATUAN ---', 'Pcs', 'Rim']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.08, // 10% of screen width
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF333B45),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            )),
                        onPressed: () {
                          ItemRow newItemValue = ItemRow(
                            kodeatk: kodeatk.text,
                            namaatk: namaatk.text,
                            jenis: jenis.text,
                            jumlah: jumlah.text,
                            satuan: _selectedUnit,
                          );

                          // Check if the item already exists
                          final existingItemIndex = viewModel.items.indexWhere(
                              (item) => item.namaatk == newItemValue.namaatk);
                          if (existingItemIndex != -1) {
                            // Item already exists, update the quantity
                            final updatedItem =
                                viewModel.items[existingItemIndex].copyWith(
                              jumlah: (int.parse(viewModel
                                          .items[existingItemIndex].jumlah) +
                                      int.parse(newItemValue.jumlah))
                                  .toString(),
                            );
                            viewModel.updateItem(
                                existingItemIndex, updatedItem);
                          } else {
                            // Item doesn't exist, add it as a new item
                            viewModel.addItem(newItemValue);
                          }

                          kodeatk.clear();
                          namaatk.clear();
                          jenis.clear();
                          jumlah.clear();
                          Navigator.pop(context);
                        },
                        child: const Text('SIMPAN',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF333B45),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                )),
                            onPressed: () {
                              setState(() {
                                kodeatk.clear();
                                namaatk.clear();
                                jenis.clear();
                                jumlah.clear();
                              });
                            },
                            child: const Text('RESET',
                                style: TextStyle(color: Colors.white)))),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF333B45),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              )),
                          // onPressed: () {
                          //   ItemRow itemToDelete = ItemRow(
                          //     kodeatk: kodeatk.text,
                          //     namaatk: namaatk.text,
                          //     jenis: jenis.text,
                          //     jumlah: jumlah.text,
                          //     satuan: _selectedUnit,
                          //   );
                          //   viewModel.removeItem(itemToDelete);

                          //   kodeatk.clear();
                          //   namaatk.clear();
                          //   jenis.clear();
                          //   jumlah.clear();

                          //   Navigator.pop(context);
                          onPressed: () {
                            viewModel.clearItems();
                            Navigator.pop(context);
                          },
                          child: const Text('CLEAR',
                              style: TextStyle(color: Colors.white))),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.08, // 10% of screen width
                    ),
                  ],
                ),
              ]));
        }));
  }
}
