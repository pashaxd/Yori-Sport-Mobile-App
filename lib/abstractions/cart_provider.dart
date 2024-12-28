import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _items = [];
  final Map<String, int> _itemCounts = {};

  num get total {
    num totalCost = 0;
    for (var item in _items) {
      String itemId = item['id'];
      totalCost += item['description'] * (_itemCounts[itemId] ?? 0);
    }
    return totalCost;
  }

  List<Map<String, dynamic>> get items => _items;

  void addItem(Map<String, dynamic> item) {
    String itemId = item['id'];
    String selectedSize=item['sizes'];
    if (_itemCounts.containsKey(itemId) ) {

        _itemCounts[itemId] = _itemCounts[itemId]! + 1;

    } else {
      _items.add(item);
      _itemCounts[itemId] = 1;
    }
    notifyListeners();
  }

  void removeItem(String itemId) {
    if (_itemCounts.containsKey(itemId)) {
      _itemCounts[itemId] = _itemCounts[itemId]! - 1;
      if (_itemCounts[itemId] == 0) {
        _itemCounts.remove(itemId);
        _items.removeWhere((item) => item['id'] == itemId);
      }
      notifyListeners();
    }
  }

  int getItemCount(String itemId) {
    return _itemCounts[itemId] ?? 0;
  }
}

