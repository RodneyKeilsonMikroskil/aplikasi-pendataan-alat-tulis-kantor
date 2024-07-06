import 'package:aplikasi_pendataan_alat_tulis_kantor/providers/view_model.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/list_model.dart';
import 'package:provider/provider.dart';

class AmbilBarang extends StatelessWidget {
  final List<RequestCard> itemsv1;
  const AmbilBarang({required this.itemsv1, super.key});

  @override
  Widget build(BuildContext context) {
    return PengambilanBarangForm(
      itemsv1: itemsv1,
    );
  }
}

class PengambilanBarangForm extends StatefulWidget {
  final List<RequestCard> itemsv1;
  const PengambilanBarangForm({required this.itemsv1, super.key});
  @override
  // ignore: library_private_types_in_public_api
  _PengambilanBarangFormState createState() => _PengambilanBarangFormState();
}

class _PengambilanBarangFormState extends State<PengambilanBarangForm> {
  TextEditingController programstudi = TextEditingController();
  TextEditingController tanggalpermintaan = TextEditingController();
  TextEditingController tanggalpengambilan = TextEditingController();
  TextEditingController namapenerima = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pengambilan Barang ATK',
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
      body: Consumer<RequestViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: programstudi,
                    decoration: const InputDecoration(
                      labelText: 'Program Studi',
                    ),
                  ),
                  TextField(
                    controller: tanggalpermintaan,
                    decoration: const InputDecoration(
                      labelText: 'Tanggal Permintaan',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Permintaan ATK",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Kertas A4\nKertas F4\nPulpen",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextField(
                    controller: tanggalpengambilan,
                    decoration: const InputDecoration(
                      labelText: 'Tanggal Pengambilan',
                    ),
                  ),
                  TextField(
                    controller: namapenerima,
                    decoration: const InputDecoration(
                      labelText: 'Nama Penerima',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF333B45),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/dashboard');
                        },
                        child: const Text(
                          'UPLOAD IMAGE',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      height: 150,
                      width: 295,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 100, 105, 111),
                      ),
                    ),
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
                            ),
                          ),
                          onPressed: () {
                            // Create a new item
                            RequestCard newItem = RequestCard(
                              programstudi: programstudi.text,
                              tanggalpermintaan: tanggalpermintaan.text,
                              tanggalpengambilan: tanggalpengambilan.text,
                              namapenerima: namapenerima.text,
                              isCheckVisible:
                                  true, // Set the initial visibility
                              isRemoveVisible: true,
                            );

                            // Add the new item to the viewModel
                            viewModel.addItem(newItem);

                            // Clear the TextEditingControllers
                            programstudi.clear();
                            tanggalpermintaan.clear();
                            tanggalpengambilan.clear();
                            namapenerima.clear();

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
                              tanggalpengambilan.clear();
                            });
                          },
                          child: const Text(
                            'RESET',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.08,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
