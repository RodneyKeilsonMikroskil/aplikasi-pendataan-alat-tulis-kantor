import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Container(
          //   height: 150,
          //   width: 185,

          // ),
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
            'Forgot Password',
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
              hintText: 'Email',
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
              Navigator.pushNamed(context, '/');
            },
            child: const Text(
              'SUBMIT',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
