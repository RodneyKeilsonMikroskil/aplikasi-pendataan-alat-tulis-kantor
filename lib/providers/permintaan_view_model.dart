import 'package:flutter/material.dart';
import 'package:aplikasi_pendataan_alat_tulis_kantor/list_model.dart';

class PermintaanViewModel extends ChangeNotifier {
  final List<RequestCard2> _items = [];

  List<RequestCard2> get items => _items;

  void addItem(RequestCard2 item) {
    _items.add(item);
    notifyListeners();
  }

  void addItems(List<RequestCard2> items) {
    _items.addAll(items);
    notifyListeners();
  }

  void removeItem(RequestCard2 item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearItems() {
    _items.clear();
    notifyListeners();
  }
}