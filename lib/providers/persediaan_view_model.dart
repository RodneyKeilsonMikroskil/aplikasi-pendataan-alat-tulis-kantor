import 'package:aplikasi_pendataan_alat_tulis_kantor/list_model.dart';
import 'package:flutter/material.dart';

class PersediaanViewModel extends ChangeNotifier {
  final List<ItemRow> _items = [];

  List<ItemRow> get items => _items;

  void updateItem(int index, ItemRow updatedItem) {
    _items[index] = updatedItem;
    notifyListeners();
  }
  
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

  void updateItemQuantity(String kodeatk, String newQuantity) {
    final itemIndex = _items.indexWhere((item) => item.kodeatk == kodeatk);
    if (itemIndex != -1) {
      _items[itemIndex] = _items[itemIndex].copyWith(jumlah: newQuantity);
      notifyListeners();
    }
  }
}