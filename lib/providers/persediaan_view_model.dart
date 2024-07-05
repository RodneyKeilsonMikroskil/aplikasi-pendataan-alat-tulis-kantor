import 'package:aplikasi_pendataan_alat_tulis_kantor/list_model.dart';
import 'package:flutter/material.dart';

class PersediaanViewModel extends ChangeNotifier {
  final List<ItemRow> _items = [];

  List<ItemRow> get items => _items;

  void addItem(ItemRow newItem) {
    _items.add(newItem);
    notifyListeners();
  }

  void removeItem(ItemRow item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearItems() {
    _items.clear();
    notifyListeners();
  }
}
