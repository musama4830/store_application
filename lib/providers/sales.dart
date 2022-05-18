import 'package:flutter/foundation.dart';

class Item {
  String id;
  String title;
  double quantity;
  int profit;

  Item({
    required this.id,
    required this.title,
    required this.quantity,
    required this.profit,
  });
}

class Items with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items {
    return [..._items];
  }

  void addItems(Item newItem) {
    final bool check = _items.any((prod) => prod.id == newItem.id);
    if (!check) {
      _items.add(newItem);
      notifyListeners();
    } else {
      _items[_items.indexWhere((prod) => prod.id == newItem.id)].quantity += newItem.quantity;
      _items[_items.indexWhere((prod) => prod.id == newItem.id)].profit += newItem.profit;
      notifyListeners();
    }
  }

  void returnItem(String id, double quantity, int profit) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex].quantity -= quantity;
      _items[prodIndex].profit -= profit;
      notifyListeners();
    } else {
      print('\n...\n...\n...\n');
    }
  }
  

  List<Item> get sortItems {
    return List.from(_items..sort((a, b) => (b.quantity).compareTo(a.quantity)));
  }
}
