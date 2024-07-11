import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/persediaan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/list_model.dart';
import 'package:provider/provider.dart';

class TambahItem extends StatelessWidget {
  final List<ItemRow> itemsv1;
  const TambahItem({required this.itemsv1, super.key});

  @override
  Widget build(BuildContext context) {
    return TambahItemATKPage(
      itemsv1: itemsv1,
    );
  }
}

class TambahItemATKPage extends StatefulWidget {
  final List<ItemRow> itemsv1;
  const TambahItemATKPage({required this.itemsv1, super.key});
  @override
  State<TambahItemATKPage> createState() => _TambahItemATKPageState();
}

class _TambahItemATKPageState extends State<TambahItemATKPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  String _selectedUnit = '--- PILIH SATUAN ---';
  TextEditingController kodeatk = TextEditingController();
  TextEditingController namaatk = TextEditingController();
  TextEditingController jenis = TextEditingController();
  TextEditingController jumlah = TextEditingController();
  List<ItemRow> items = [];
  @override
  void initState() {
    super.initState();
    items = List.from(widget.itemsv1);
  }

  @override
  Widget build(BuildContext context) {
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
              )
            ],
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
                      width: MediaQuery.of(context).size.width * 0.08,
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
                              viewModel.addItem(newItemValue);

                              kodeatk.clear();
                              namaatk.clear();
                              jenis.clear();
                              jumlah.clear();

                              Navigator.pop(context);
                            },
                            child: const Text('SIMPAN',
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
                              Navigator.pushNamed(context, '/persediaanBarang');
                            },
                            child: const Text('CLEAR',
                                style: TextStyle(color: Colors.white)))),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                  ],
                ),
              ]));
        }));
  }
}
