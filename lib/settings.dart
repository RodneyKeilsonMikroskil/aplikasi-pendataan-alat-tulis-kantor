import 'package:aplikasi_pendataan_alat_tulis_kantor/account.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/displaysettings.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/notifications.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blue,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.grey : Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: const Text(
              'Account',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage()),
              );
            },
          ),
          // const Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: Text(
          //     'Media Previews',
          //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //   ),
          // ),
          // SwitchListTile(
          //   title: const Text('Media Previews'),
          //   value: Provider.of<ThemeProvider>(context).mediaPreviews,
          //   onChanged: (bool value) {
          //     Provider.of<ThemeProvider>(context, listen: false)
          //         .toggleMediaPreviews(value);
          //   },
          // ),
          ListTile(
            title: const Text(
              'Display Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DisplaySettingsPage()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
