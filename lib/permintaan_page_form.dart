import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/permintaan_view_model.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/persediaan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/list_model.dart';
import 'package:provider/provider.dart';

class PermintaanBarangForm extends StatefulWidget {
  const PermintaanBarangForm({super.key});

  @override
  _PermintaanBarangFormState createState() => _PermintaanBarangFormState();
}

class _PermintaanBarangFormState extends State<PermintaanBarangForm> {
  final TextEditingController programstudi = TextEditingController();
  final TextEditingController tanggalpermintaan = TextEditingController();
  final Map<String, int> _quantities = {};

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Permintaan Barang',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Consumer<PersediaanViewModel>(
        builder: (context, persediaanViewModel, child) {
          return Consumer<PermintaanViewModel>(
            builder: (context, permintaanViewModel, child) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: programstudi,
                      decoration: const InputDecoration(
                        labelText: 'Program Studi',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: tanggalpermintaan,
                      decoration: const InputDecoration(
                        labelText: 'Tanggal Permintaan',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        _selectDate(context, tanggalpermintaan);
                      },
                    ),
                    const SizedBox(height: 32),
                    Expanded(
                      child: ListView.builder(
                        itemCount: persediaanViewModel.items.length,
                        itemBuilder: (context, index) {
                          final item = persediaanViewModel.items[index];
                          final availableQuantity = int.parse(item.jumlah);
                          final requestedQuantity =
                              _quantities[item.kodeatk] ?? 0;

                          return ListTile(
                            title: Text(item.namaatk),
                            subtitle: Text('Tersedia: $availableQuantity'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (requestedQuantity > 0) {
                                        _quantities[item.kodeatk] =
                                            requestedQuantity - 1;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text(requestedQuantity.toString()),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (requestedQuantity <
                                          availableQuantity) {
                                        _quantities[item.kodeatk] =
                                            requestedQuantity + 1;
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF333B45),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            onPressed: () {
                              final List<RequestCard2> requestItems = [];

                              _quantities.forEach((kodeatk, quantity) {
                                final item = persediaanViewModel.items
                                    .firstWhere(
                                        (item) => item.kodeatk == kodeatk);
                                requestItems.add(RequestCard2(
                                  namaatk: item.namaatk,
                                  programstudi: programstudi.text,
                                  tanggalpermintaan: tanggalpermintaan.text,
                                  quantity: '$quantity Pcs',
                                  isCheckVisible: true,
                                  isRemoveVisible: true,
                                ));
                              });

                              permintaanViewModel.addItems(requestItems);

                              programstudi.clear();
                              tanggalpermintaan.clear();
                              _quantities.clear();

                              Navigator.pop(context);
                            },
                            child: const Text(
                              'SIMPAN',
                              style: TextStyle(color: Colors.white),
                            ),
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
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                programstudi.clear();
                                tanggalpermintaan.clear();
                                _quantities.clear();
                              });
                            },
                            child: const Text(
                              'RESET',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
