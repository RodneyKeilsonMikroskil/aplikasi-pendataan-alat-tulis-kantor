import 'package:flutter/material.dart';

class TambahItemATKPageAdmin extends StatefulWidget {
  @override
  State<TambahItemATKPageAdmin> createState() => _TambahItemATKPageAdminState();
}

class _TambahItemATKPageAdminState extends State<TambahItemATKPageAdmin> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  String _selectedUnit = '--- PILIH SATUAN ---';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: AppBar(
          title: const Text(
            'Tambah Item ATK Admin',
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
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
          ],
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
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Keluar',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      )),
                ),
              )
            ],
          ),
        ),
        body: Center(
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
              const TextField(
                decoration: InputDecoration(
                    constraints: BoxConstraints(maxWidth: 375.0),
                    labelText: 'Kode ATK'),
              ),
              const TextField(
                decoration: InputDecoration(
                    constraints: BoxConstraints(maxWidth: 375.0),
                    labelText: 'Nama ATK'),
              ),
              const TextField(
                decoration: InputDecoration(
                    constraints: BoxConstraints(maxWidth: 375.0),
                    labelText: 'Jenis'),
              ),
              const TextField(
                decoration: InputDecoration(
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
              SizedBox(
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
              ),
              const SizedBox(height: 20),
              Container(
                  height: 150,
                  width: 295,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 100, 105, 111))),
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.08, // 10% of screen width
                  ),
                ],
              ),
            ])));
  }
}
