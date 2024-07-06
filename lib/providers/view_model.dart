import 'package:flutter/material.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/list_model.dart';

class RequestViewModel extends ChangeNotifier {
  final List<RequestCard> _items = [];

  List<RequestCard> get items => _items;

  void addItem(RequestCard newItem) {
    _items.add(newItem);
    notifyListeners();
  }

  void clearItems() {
    _items.clear();
    notifyListeners();
  }
}
