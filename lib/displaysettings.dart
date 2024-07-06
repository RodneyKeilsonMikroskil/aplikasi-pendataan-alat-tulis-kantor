import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class DisplaySettingsPage extends StatelessWidget {
  const DisplaySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Display Settings',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.grey : Colors.white,
          ),
        ),
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blue,
        iconTheme: IconThemeData(
          color: isDarkMode
              ? Colors.grey
              : Colors.white, // Ubah warna ikon back button
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioListTile<ThemeMode>(
            title: const Text('Dark mode off'),
            value: ThemeMode.light,
            groupValue: Provider.of<ThemeProvider>(context).themeMode,
            onChanged: (ThemeMode? value) {
              if (value != null) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(value);
              }
            },
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark mode on'),
            value: ThemeMode.dark,
            groupValue: Provider.of<ThemeProvider>(context).themeMode,
            onChanged: (ThemeMode? value) {
              if (value != null) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(value);
              }
            },
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Use device settings'),
            value: ThemeMode.system,
            groupValue: Provider.of<ThemeProvider>(context).themeMode,
            onChanged: (ThemeMode? value) {
              if (value != null) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(value);
              }
            },
          ),
        ],
      ),
    );
  }
}
