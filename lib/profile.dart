import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blue,
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
            'Profile',
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
          const Text("Coming soon."),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF333B45),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                )),
            onPressed: () {
              Navigator.pushNamed(context, '/dashboard');
            },
            child: const Text(
              'KEMBALI',
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
