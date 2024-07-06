import 'package:aplikasi_pendataan_alat_tulis_kantor/notificationsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.grey : Colors.white,
          ),
        ),
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.blue,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.grey : Colors.white,
        ),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Show notifications'),
            value:
                Provider.of<NotificationsProvider>(context).showNotifications,
            onChanged: (bool value) {
              Provider.of<NotificationsProvider>(context, listen: false)
                  .toggleShowNotifications(value);
            },
          ),
          SwitchListTile(
            title: const Text('Notification spotlight'),
            subtitle: const Text(
                'Use custom notification format to highlight important info'),
            value: Provider.of<NotificationsProvider>(context)
                .notificationSpotlight,
            onChanged: (bool value) {
              Provider.of<NotificationsProvider>(context, listen: false)
                  .toggleNotificationSpotlight(value);
            },
          ),
          ListTile(
            title: const Text(
              'Notification permissions',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              // Handle tap if needed
            },
          ),
          SwitchListTile(
            title: const Text('Notification badges'),
            value:
                Provider.of<NotificationsProvider>(context).notificationBadges,
            onChanged: (bool value) {
              Provider.of<NotificationsProvider>(context, listen: false)
                  .toggleNotificationBadges(value);
            },
          ),
          SwitchListTile(
            title: const Text('Floating notifications'),
            value: Provider.of<NotificationsProvider>(context)
                .floatingNotifications,
            onChanged: (bool value) {
              Provider.of<NotificationsProvider>(context, listen: false)
                  .toggleFloatingNotifications(value);
            },
          ),
          SwitchListTile(
            title: const Text('Lock screen notifications'),
            value: Provider.of<NotificationsProvider>(context)
                .lockScreenNotifications,
            onChanged: (bool value) {
              Provider.of<NotificationsProvider>(context, listen: false)
                  .toggleLockScreenNotifications(value);
            },
          ),
          SwitchListTile(
            title: const Text('Sound'),
            value: Provider.of<NotificationsProvider>(context).sound,
            onChanged: (bool value) {
              Provider.of<NotificationsProvider>(context, listen: false)
                  .toggleSound(value);
            },
          ),
          SwitchListTile(
            title: const Text('Vibration'),
            value: Provider.of<NotificationsProvider>(context).vibration,
            onChanged: (bool value) {
              Provider.of<NotificationsProvider>(context, listen: false)
                  .toggleVibration(value);
            },
          ),
          SwitchListTile(
            title: const Text('Permanent notifications'),
            value: Provider.of<NotificationsProvider>(context)
                .permanentNotifications,
            onChanged: (bool value) {
              Provider.of<NotificationsProvider>(context, listen: false)
                  .togglePermanentNotifications(value);
            },
          ),
        ],
      ),
    );
  }
}
