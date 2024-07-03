import 'package:flutter/material.dart';

class PermintaanPage extends StatefulWidget {
  @override
  State<PermintaanPage> createState() => PermintaanPageState();
}

class PermintaanPageState extends State<PermintaanPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  void _showDialogSetuju() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Status: DITERIMA'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Catatan :"),
              Text("Silakan dilanjutkan",
                  style: TextStyle(color: Colors.black.withOpacity(0.5))),
            ],
          ),
        );
      },
    );
  }

  void _showDialogDitolak() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Status: DITOLAK'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Catatan :"),
              Text("Terlalu Banyak Jumlahnya",
                  style: TextStyle(color: Colors.black.withOpacity(0.5))),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: AppBar(
          title: const Text(
            'Permintaan Barang',
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
        body: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    RequestCard(
                      title: 'Ilmu Komputer',
                      date: '12 Oktober 2022',
                      items: [
                        RequestItem(name: 'Pulpen', quantity: 5, unit: 'Pcs'),
                        RequestItem(
                            name: 'Kertas A4', quantity: 2, unit: 'Rim'),
                        RequestItem(
                            name: 'Kertas F4', quantity: 2, unit: 'Rim'),
                        RequestItem(
                            name: 'Paper Clip', quantity: 1, unit: 'Kotak'),
                      ],
                      method1: _showDialogSetuju,
                      method2: _showDialogDitolak,
                    ),
                    RequestCard(
                      title: 'Ilmu Komputer',
                      date: '12 September 2022',
                      status: RequestStatus.completed,
                      items: [
                        RequestItem(
                            name: 'Kertas A4', quantity: 5, unit: 'Rim'),
                      ],
                      method1: _showDialogSetuju,
                      method2: _showDialogDitolak,
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.black.withOpacity(0.65),
                  onPressed: () {
                    Navigator.pushNamed(context, '/permintaanBarang2');
                  },
                  child: Icon(Icons.add, color: Colors.white),
                  shape: CircleBorder(),
                ),
              ),
            ),
          ],
        ));
  }
}

class RequestCard extends StatelessWidget {
  final String title;
  final String date;
  final List<RequestItem> items;
  final RequestStatus? status;
  final method1;
  final method2;

  const RequestCard({
    required this.title,
    required this.date,
    required this.items,
    this.status,
    this.method1,
    this.method2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...items.map((item) => RequestItemWidget(item: item)).toList(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date),
                status == RequestStatus.completed
                    ? GestureDetector(
                        onTap: () {
                          method1();
                        },
                        child: Icon(Icons.check_circle, color: Colors.green),
                      )
                    : GestureDetector(
                        onTap: () {
                          method2();
                        },
                        child: Icon(Icons.cancel, color: Colors.red),
                      )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RequestItemWidget extends StatelessWidget {
  final RequestItem item;

  const RequestItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(item.name),
        SizedBox(width: 8),
        Text('${item.quantity} ${item.unit}'),
      ],
    );
  }
}

class RequestItem {
  final String name;
  final int quantity;
  final String unit;

  RequestItem({
    required this.name,
    required this.quantity,
    required this.unit,
  });
}

enum RequestStatus { completed, pending }
