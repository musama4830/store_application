import 'package:flutter/material.dart';

class Product{
  String id;
  String title;
  double totalQuantity;
  int purchasePrice;
  int salePrice;

  Product({
    required this.id,
    required this.title,
    required this.totalQuantity,
    required this.purchasePrice,
    required this.salePrice,
  });
}

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirts',
      totalQuantity: 5,
      purchasePrice: 21,
      salePrice: 30,
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      totalQuantity: 120,
      purchasePrice: 41,
      salePrice: 50,
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      totalQuantity: 9,
      purchasePrice: 31,
      salePrice: 40,
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      totalQuantity: 12,
      purchasePrice: 21,
      salePrice: 30,
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    final newProduct = Product(
      id: product.id,
      title: product.title,
      totalQuantity: product.totalQuantity,
      purchasePrice: product.purchasePrice,
      salePrice: product.salePrice,
    );
    _items.add(newProduct);
    // _items.insert(0, newProduct); // at the start of the list
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('\n...\n...\n...\n');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
  
  int limit = 10;
  void updateLimit(int value) {
    limit = value;
    notifyListeners();
  }
  List<Product> get lessItems {
    return List.from(_items.where((data) => data.totalQuantity <= limit));
  }

  void saleProduct(String id, double quantity) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex].totalQuantity -= quantity;
      notifyListeners();
    } else {
      print('\n...\n...\n...\n');
    }
  }

  void returnProduct(String id, double quantity) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex].totalQuantity += quantity;
      notifyListeners();
    } else {
      print('\n...\n...\n...\n');
    }
  }
}
