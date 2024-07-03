import 'package:flutter/material.dart';

class PermintaanBarangDuaPage extends StatefulWidget {
  @override
  _PermintaanBarangDuaPageState createState() =>
      _PermintaanBarangDuaPageState();
}

class _PermintaanBarangDuaPageState extends State<PermintaanBarangDuaPage> {
  String _selectedUnit = '--- PILIH ATK ---';
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tambah ATK'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: _selectedUnit,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedUnit = newValue!;
                  });
                  Navigator.of(context).pop();
                  _showDialog();
                },
                items: <String>['--- PILIH ATK ---', 'Pulpen', 'Buku']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('DISAGREE'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('AGREE'),
            ),
          ],
        );
      },
    );
  }

  final TextEditingController _programStudiController = TextEditingController();
  final TextEditingController _tanggalPermintaanController =
      TextEditingController();
  int _quantity = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _programStudiController,
              decoration: const InputDecoration(
                labelText: 'Program Studi',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _tanggalPermintaanController,
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
                      icon: Icon(Icons.remove_circle),
                    ),
                    Text('$_quantity'),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _quantity++;
                        });
                      },
                      icon: Icon(Icons.add_circle),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF333B45),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            )),
                        onPressed: () {},
                        child: const Text('DELETE',
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.black.withOpacity(0.65),
                  onPressed: () {
                    _showDialog();
                  },
                  child: Icon(Icons.add, color: Colors.white),
                  shape: CircleBorder(),
                ),
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
                        child: const Text('DELETE',
                            style: TextStyle(color: Colors.white)))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
