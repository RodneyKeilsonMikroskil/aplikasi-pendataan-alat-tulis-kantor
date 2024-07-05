import 'package:flutter/material.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/list_model.dart';
import 'package:provider/provider.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/permintaan_view_model.dart';

class PermintaanBarangForm extends StatefulWidget {
  const PermintaanBarangForm({super.key});

  @override
  _PermintaanBarangFormState createState() => _PermintaanBarangFormState();
}

class _PermintaanBarangFormState extends State<PermintaanBarangForm> {
  final TextEditingController programstudi = TextEditingController();
  final TextEditingController tanggalpermintaan = TextEditingController();
  int _quantity = 10;

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.blue.withOpacity(0.85),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<PermintaanViewModel>(
        builder: (context, viewModel, child) {
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
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Kertas A4',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _quantity = _quantity > 0 ? _quantity - 1 : 0;
                            });
                          },
                          icon: const Icon(Icons.remove_circle),
                        ),
                        SizedBox(
                          width: 50,
                          child: Text(
                            '$_quantity',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _quantity++;
                            });
                          },
                          icon: const Icon(Icons.add_circle),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
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
                          RequestCard2 newItemValue = RequestCard2(
                            programstudi: programstudi.text,
                            tanggalpermintaan: tanggalpermintaan.text,
                            quantity: '$_quantity Pcs',
                            isCheckVisible: true,
                            isRemoveVisible: true
                          );

                          viewModel.addItem(newItemValue);

                          programstudi.clear();
                          tanggalpermintaan.clear();

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
      ),
    );
  }
}