import 'package:flutter/material.dart';

class AccountModel with ChangeNotifier {
  String _username = 'JohnDoe';
  String _phone = '+62 123 456 7890';
  String _email = 'john.doe@example.com';
  String _country = 'Indonesia';

  String get username => _username;
  String get phone => _phone;
  String get email => _email;
  String get country => _country;

  void updateAccount(
      String username, String phone, String email, String country) {
    _username = username;
    _phone = phone;
    _email = email;
    _country = country;
    notifyListeners();
  }
}
