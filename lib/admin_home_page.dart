import 'package:aplikasi_pendataan_alat_tulis_kantor/dashboard_page.dart';
import 'package:flutter/material.dart';

class AdminDashboardHomePage extends StatelessWidget {
  const AdminDashboardHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Image.asset(
          'logo-color.png',
          height: 150,
          width: 185,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 20),
        Container(
          height: 1.0,
          width: 250,
          color: Colors.blue,
        ),
        const SizedBox(height: 10),
        const Text(
          'Menu Data ATK',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 1.0,
          width: 325,
          color: Colors.blue,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1.2,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/persediaanBarang');
                },
                child: const MenuButton(
                  title: 'Persediaan Barang ATK',
                  icon: Icons.inventory,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/permintaanBarang');
                },
                child: const MenuButton(
                  title: 'Persetujuan ATK',
                  icon: Icons.request_page,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/pengambilanBarang');
                },
                child: const MenuButton(
                  title: 'Pengambilan Barang',
                  icon: Icons.request_page,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/contact');
                },
                child: const MenuButton(
                  title: 'Contact',
                  icon: Icons.contact_mail,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: const MenuButton(
                  title: 'Profil',
                  icon: Icons.person,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/tambahBarangAdmin');
                },
                child: const MenuButton(
                  title: 'Tambah Item ATK Admin',
                  icon: Icons.admin_panel_settings,
                ),
              ),
              const MenuButton(
                title: 'Coming Soon',
                icon: Icons.watch_later,
              ),
              const MenuButton(
                title: 'Coming Soon',
                icon: Icons.watch_later,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
