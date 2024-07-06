import 'package:aplikasi_pendataan_alat_tulis_kantor/accountmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccountModel>(context);
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account Information',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blue,
        iconTheme: IconThemeData(
          color: isDarkMode
              ? Colors.grey
              : Colors.white, // Ubah warna ikon back button
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoTile(
              'Username',
              _maskName(account.username),
              isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(height: 16.0),
            _buildInfoTile(
              'Phone',
              _maskPhone(account.phone),
              isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(height: 16.0),
            _buildInfoTile(
              'Email',
              _maskEmail(account.email),
              isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(height: 16.0),
            _buildInfoTile(
              'Country',
              account.country,
              isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(height: 32.0),
            const Text(
              'Automation',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Text(
              'Manage your automated account.',
              style: TextStyle(
                fontSize: 14.0,
                color: isDarkMode
                    ? Colors.white.withOpacity(0.7)
                    : const Color.fromARGB(255, 25, 10, 10),
              ),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text(
                  'Log out',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
    );
  }

  String _maskEmail(String email) {
    final parts = email.split('@');
    final username = parts[0];
    final domain = parts[1];
    final maskedUsername =
        username.length > 3 ? '${username.substring(0, 3)}****' : '****';
    return '$maskedUsername@$domain';
  }

  String _maskPhone(String phone) {
    return phone.length > 4
        ? '${phone.substring(0, 4)}****${phone.substring(phone.length - 2)}'
        : '****';
  }

  String _maskName(String name) {
    return name.length > 2 ? '${name[0]}****${name[name.length - 1]}' : '****';
  }

  Widget _buildInfoTile(String title, String value, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.0,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
