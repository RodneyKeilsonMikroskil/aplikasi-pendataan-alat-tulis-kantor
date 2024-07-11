import 'package:flutter/material.dart';

class DashboardProfilePage extends StatelessWidget {
  const DashboardProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

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
          Text(
            'Aplikasi Pendataan\nATK (Alat Tulis Kantor)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color.fromARGB(255, 96, 95, 95)
                  : Colors.blue,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 1.0,
            width: 250,
            color: isDarkMode
                ? const Color.fromARGB(255, 96, 95, 95)
                : Colors.blue,
          ),
          const SizedBox(height: 10),
          Text(
            'Profile',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color.fromARGB(255, 96, 95, 95)
                  : Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 1.0,
            width: 325,
            color: isDarkMode
                ? const Color.fromARGB(255, 96, 95, 95)
                : Colors.blue,
          ),
          const SizedBox(height: 20),
          Text(
            'Coming soon.',
            style: TextStyle(
              fontSize: 16,
              color: isDarkMode ? Colors.white70 : Colors.black,
            ),
          ),
          const SizedBox(height: 20),
        ]),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
    );
  }
}
