import 'package:flutter/material.dart';

class AdminDashboardProfilePage extends StatelessWidget {
  const AdminDashboardProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'logo-color.png',
            height: 150,
            width: 185,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const Text(
            'Aplikasi Pendataan\nATK (Alat Tulis Kantor)',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 20),
          Container(
            height: 1.0,
            width: 250,
            color: Colors.blue,
          ),
          const SizedBox(height: 10),
          const Text(
            'Profile',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 10),
          Container(
            height: 1.0,
            width: 325,
            color: Colors.blue,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Coming soon."),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
