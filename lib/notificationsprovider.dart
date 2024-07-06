import 'package:flutter/material.dart';

class NotificationsProvider with ChangeNotifier {
  bool _showNotifications = true;
  bool _notificationSpotlight = true;
  bool _notificationBadges = true;
  bool _floatingNotifications = true;
  bool _lockScreenNotifications = false;
  bool _sound = true;
  bool _vibration = true;
  bool _permanentNotifications = true;

  bool get showNotifications => _showNotifications;
  bool get notificationSpotlight => _notificationSpotlight;
  bool get notificationBadges => _notificationBadges;
  bool get floatingNotifications => _floatingNotifications;
  bool get lockScreenNotifications => _lockScreenNotifications;
  bool get sound => _sound;
  bool get vibration => _vibration;
  bool get permanentNotifications => _permanentNotifications;

  void toggleShowNotifications(bool value) {
    _showNotifications = value;
    notifyListeners();
  }

  void toggleNotificationSpotlight(bool value) {
    _notificationSpotlight = value;
    notifyListeners();
  }

  void toggleNotificationBadges(bool value) {
    _notificationBadges = value;
    notifyListeners();
  }

  void toggleFloatingNotifications(bool value) {
    _floatingNotifications = value;
    notifyListeners();
  }

  void toggleLockScreenNotifications(bool value) {
    _lockScreenNotifications = value;
    notifyListeners();
  }

  void toggleSound(bool value) {
    _sound = value;
    notifyListeners();
  }

  void toggleVibration(bool value) {
    _vibration = value;
    notifyListeners();
  }

  void togglePermanentNotifications(bool value) {
    _permanentNotifications = value;
    notifyListeners();
  }
}
