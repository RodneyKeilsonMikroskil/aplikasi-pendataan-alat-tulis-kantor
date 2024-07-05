import 'package:aplikasi_pendataan_alat_tulis_kantor/dashboard_page.dart';
import 'package:flutter/material.dart';

// ... (previous code remains the same) ...

class AdminSearchPage extends StatefulWidget {
  const AdminSearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminSearchPageState createState() => _AdminSearchPageState();
}

class _AdminSearchPageState extends State<AdminSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];
  bool _showOnlyAvailable = false;

  final List<Map<String, dynamic>> _menuItems = [
    {
      'title': 'Persediaan Barang ATK',
      'icon': Icons.inventory,
      'route': '/persediaanBarang',
      'available': true,
    },
    {
      'title': 'Tambah Item ATK',
      'icon': Icons.add_circle,
      'route': '/tambahItem',
      'available': true,
    },
    {
      'title': 'Permintaan/Persetujuan ATK',
      'icon': Icons.request_page,
      'route': '/permintaanBarang',
      'available': true,
    },
    {
      'title': 'Pengambilan ATK',
      'icon': Icons.shopping_cart,
      'route': '/pengambilanBarang',
      'available': true,
    },
    {
      'title': 'Contact',
      'icon': Icons.contact_mail,
      'route': '/contact',
      'available': true,
    },
    {
      'title': 'Profile',
      'icon': Icons.person,
      'route': '/profile',
      'available': true,
    },
    {
      'title': 'Tambah Item ATK Admin',
      'icon': Icons.admin_panel_settings,
      'route': '/tambahBarangAdmin',
      'available': true,
    },
    {
      'title': 'Coming Soon',
      'icon': Icons.watch_later,
      'route': '#',
      'available': false,
    },
    {
      'title': 'Coming Soon',
      'icon': Icons.watch_later,
      'route': '#',
      'available': false,
    },
  ];

  void _performSearch(String query) {
    _searchResults = _menuItems
        .where((item) =>
            item['title']!.toLowerCase().contains(query.toLowerCase()) &&
            (!_showOnlyAvailable || item['available']))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _performSearch(_searchController.text);
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Show Only Available',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Switch(
                  value: _showOnlyAvailable,
                  onChanged: (value) {
                    setState(() {
                      _showOnlyAvailable = value;
                      _performSearch(_searchController.text);
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              children: _searchResults
                  .map(
                    (item) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, item['route']);
                      },
                      child: MenuButton(
                        title: item['title'],
                        icon: item['icon'],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
