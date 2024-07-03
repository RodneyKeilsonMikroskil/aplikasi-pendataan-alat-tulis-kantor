import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 1.0,
            width: 250,
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          const Text(
            'Akbar Serdano',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 1.0,
            width: 325,
            color: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Full Name',
              constraints: BoxConstraints(maxWidth: 300.0),
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Email',
              constraints: BoxConstraints(maxWidth: 300.0),
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Old Password',
              constraints: BoxConstraints(maxWidth: 300.0),
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'New Password',
              constraints: BoxConstraints(maxWidth: 300.0),
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Re-New Password',
              constraints: BoxConstraints(maxWidth: 300.0),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF333B45),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                )),
            onPressed: () {
              Navigator.pushNamed(context, '/dashboard');
            },
            child: const Text(
              'SIMPAN',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
