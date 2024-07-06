import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blue,
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
            'Registrasi Account',
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
              hintText: 'Password',
              constraints: BoxConstraints(maxWidth: 300.0),
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Re-Password',
              constraints: BoxConstraints(maxWidth: 300.0),
            ),
          ),
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
              'REGISTER',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.1, // 10% of screen width
              ),
              const Expanded(
                flex: 8,
                child: Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: isDarkMode
                          ? const Color.fromARGB(255, 176, 176, 176)
                          : Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.1, // 10% of screen width
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
