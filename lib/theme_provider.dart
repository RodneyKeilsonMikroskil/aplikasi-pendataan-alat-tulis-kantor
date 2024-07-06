import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  bool _mediaPreviews = false;

  ThemeMode get themeMode => _themeMode;
  bool get mediaPreviews => _mediaPreviews;

  void toggleTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  void toggleMediaPreviews(bool value) {
    _mediaPreviews = value;
    notifyListeners();
  }
}
