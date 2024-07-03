import 'package:flutter/material.dart';

class PengambilanBarang extends StatefulWidget {
  @override
  _PengambilanBarangState createState() => _PengambilanBarangState();
}

class _PengambilanBarangState extends State<PengambilanBarang> {
  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Program Studi',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
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
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Tanggal Pengambilan',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
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
                        )),
                    onPressed: () {
                      Navigator.pushNamed(context, '/dashboard');
                    },
                    child: const Text('UPLOAD IMAGE',
                        style: TextStyle(color: Colors.white))),
              )),
              const SizedBox(height: 20),
              Center(
                  child: Container(
                      height: 150,
                      width: 295,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 100, 105, 111)))),
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
                            Navigator.pushNamed(context, '/dashboard');
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
                            Navigator.pushNamed(context, '/dashboard');
                          },
                          child: const Text('RESET',
                              style: TextStyle(color: Colors.white)))),
                  SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.08, // 10% of screen width
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
