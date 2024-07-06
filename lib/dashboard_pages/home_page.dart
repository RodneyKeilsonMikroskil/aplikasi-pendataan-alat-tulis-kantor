import 'package:aplikasi_pendataan_alat_tulis_kantor/menu_button.dart';
import 'package:flutter/material.dart';

class DashboardHomePage extends StatelessWidget {
  const DashboardHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness themeBrightness = Theme.of(context).brightness;

    Color titleColor =
        themeBrightness == Brightness.dark ? Colors.grey : Colors.blue;
    Color lineColor =
        themeBrightness == Brightness.dark ? Colors.grey : Colors.blue;
    Color buttonColor =
        themeBrightness == Brightness.dark ? Colors.grey : Colors.blue;

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
          color: lineColor,
        ),
        const SizedBox(height: 10),
        Text(
          'Menu Data ATK',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 1.0,
          width: 325,
          color: lineColor,
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
                child: MenuButton(
                  title: 'Persediaan ATK',
                  icon: Icons.inventory,
                  color: buttonColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/permintaanBarangForm');
                },
                child: MenuButton(
                  title: 'Permintaan ATK',
                  icon: Icons.request_page,
                  color: buttonColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/pengambilanBarang');
                },
                child: MenuButton(
                  title: 'Riwayat Persetujuan ATK',
                  icon: Icons.shopping_cart,
                  color: buttonColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/contact');
                },
                child: MenuButton(
                  title: 'Contact',
                  icon: Icons.contact_mail,
                  color: buttonColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: MenuButton(
                  title: 'Profil',
                  icon: Icons.person,
                  color: buttonColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
