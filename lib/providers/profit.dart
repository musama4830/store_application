import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Order {
  String id;
  int totalProfit;

  Order({
    required this.id,
    required this.totalProfit,
  });
}

class Orders with ChangeNotifier {
  final List<Order> _order = [
    Order(
      id: '2022-04-30',
      totalProfit: 1500,
    ),
    Order(
      id: '2022-05-11',
      totalProfit: 1500,
    ),
    Order(
      id: '2022-05-12',
      totalProfit: 1500,
    ),
    Order(
      id: '2022-05-13',
      totalProfit: 1500,
    ),
    Order(
      id: '2022-05-14',
      totalProfit: 2500,
    ),
    Order(
      id: '2022-05-15',
      totalProfit: 1700,
    ),
    Order(
      id: '2022-05-16',
      totalProfit: 1500,
    ),
    Order(
      id: '2022-05-17',
      totalProfit: 300,
    ),
  ];

  List<Order> get order {
    return [..._order];
  }

  void addOrder(Order newOrder) {
    final bool check = _order.any((item) => item.id == newOrder.id);
    if (!check) {
      _order.add(newOrder);
      notifyListeners();
    } else {
      _order[_order.indexWhere((item) => item.id == newOrder.id)].totalProfit += newOrder.totalProfit;
      notifyListeners();
    }
  }
  
  String id = '';
  
  void returnOrder(int profit) {
    id = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final prodIndex = _order.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _order[prodIndex].totalProfit -= profit;
      notifyListeners();
    } else {
      print('\n...\n...\n...\n');
    }
  }

  int _todayProfit = 0, _weekProfit = 0, _monthProfit = 0;
  void showProfit() {
   _todayProfit = _order[order.length-1].totalProfit;
    id = DateFormat('yyyy-MM-dd').format(DateTime.now());
    for (int i=1; i<=7; i++) {
      _weekProfit += _order[_order.length-i].totalProfit;
    }
    id = DateFormat('yyyy-MM').format(DateTime.now());
    for (int i=1; i<=_order.length; i++) {
      if(_order[_order.length-i].id.startsWith(id)) {
        _monthProfit += _order[_order.length-i].totalProfit;
      }
    }
  }

  int get todayProfit {
    return _todayProfit;
  }

  int get weekProfit {
    return _weekProfit;
  }

  int get monthProfit {
    return _monthProfit;
  }
}
