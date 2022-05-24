import 'dart:typed_data';
import 'package:flutter/material.dart';

class Product {
  String id;
  String title;
  double totalQuantity;
  int purchasePrice;
  int salePrice;
  Uint8List image;

  Product({
    required this.id,
    required this.title,
    required this.totalQuantity,
    required this.purchasePrice,
    required this.salePrice,
    required this.image,
  });
}

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'a01',
      title: 'Red Shirts',
      totalQuantity: 5,
      purchasePrice: 21,
      salePrice: 30,
      image: Uint8List.fromList('p01'.codeUnits),
    ),
    Product(
      id: 'a02',
      title: 'Trousers',
      totalQuantity: 120,
      purchasePrice: 41,
      salePrice: 50,
      image: Uint8List.fromList('p02'.codeUnits),
    ),
    Product(
      id: 'a03',
      title: 'Yellow Scarf',
      totalQuantity: 9,
      purchasePrice: 31,
      salePrice: 40,
      image: Uint8List.fromList('p03'.codeUnits),
    ),
    Product(
      id: 'a04',
      title: 'A Pan',
      totalQuantity: 12,
      purchasePrice: 21,
      salePrice: 30,
      image: Uint8List.fromList('p04'.codeUnits),
    ),
    Product(
      id: 'a05',
      title: 'Red Shirts',
      totalQuantity: 5,
      purchasePrice: 21,
      salePrice: 30,
      image: Uint8List.fromList('p01'.codeUnits),
    ),
    Product(
      id: 'a06',
      title: 'Trousers',
      totalQuantity: 120,
      purchasePrice: 41,
      salePrice: 50,
      image: Uint8List.fromList('p02'.codeUnits),
    ),
    Product(
      id: 'a07',
      title: 'Yellow Scarf',
      totalQuantity: 9,
      purchasePrice: 31,
      salePrice: 40,
      image: Uint8List.fromList('p03'.codeUnits),
    ),
    Product(
      id: 'a08',
      title: 'A Pan',
      totalQuantity: 12,
      purchasePrice: 21,
      salePrice: 30,
      image: Uint8List.fromList('p04'.codeUnits),
    ),
    Product(
      id: 'a09',
      title: 'Red Shirts',
      totalQuantity: 5,
      purchasePrice: 21,
      salePrice: 30,
      image: Uint8List.fromList('p01'.codeUnits),
    ),
    Product(
      id: 'a10',
      title: 'Trousers',
      totalQuantity: 120,
      purchasePrice: 41,
      salePrice: 50,
      image: Uint8List.fromList('p02'.codeUnits),
    ),
    Product(
      id: 'a11',
      title: 'Yellow Scarf',
      totalQuantity: 9,
      purchasePrice: 31,
      salePrice: 40,
      image: Uint8List.fromList('p03'.codeUnits),
    ),
    Product(
      id: 'a12',
      title: 'A Pan',
      totalQuantity: 12,
      purchasePrice: 21,
      salePrice: 30,
      image: Uint8List.fromList('p04'.codeUnits),
    ),
    Product(
      id: 'a13',
      title: 'Red Shirts',
      totalQuantity: 5,
      purchasePrice: 21,
      salePrice: 30,
      image: Uint8List.fromList('p01'.codeUnits),
    ),
    Product(
      id: 'a14',
      title: 'Trousers',
      totalQuantity: 120,
      purchasePrice: 41,
      salePrice: 50,
      image: Uint8List.fromList('p02'.codeUnits),
    ),
    Product(
      id: 'a15',
      title: 'Yellow Scarf',
      totalQuantity: 9,
      purchasePrice: 31,
      salePrice: 40,
      image: Uint8List.fromList('p03'.codeUnits),
    ),
    Product(
      id: 'a16',
      title: 'A Pan',
      totalQuantity: 12,
      purchasePrice: 21,
      salePrice: 30,
      image: Uint8List.fromList('p04'.codeUnits),
    ),
    Product(
      id: 'a17',
      title: 'Red Shirts',
      totalQuantity: 5,
      purchasePrice: 21,
      salePrice: 30,
      image: Uint8List.fromList('p01'.codeUnits),
    ),
    Product(
      id: 'a18',
      title: 'Trousers',
      totalQuantity: 120,
      purchasePrice: 41,
      salePrice: 50,
      image: Uint8List.fromList('p02'.codeUnits),
    ),
    Product(
      id: 'a19',
      title: 'Yellow Scarf',
      totalQuantity: 9,
      purchasePrice: 31,
      salePrice: 40,
      image: Uint8List.fromList('p03'.codeUnits),
    ),
    Product(
      id: 'a20',
      title: 'A Pan',
      totalQuantity: 12,
      purchasePrice: 21,
      salePrice: 30,
      image: Uint8List.fromList('p04'.codeUnits),
    ),
    Product(
      id: 'a21',
      title: 'Red Shirts',
      totalQuantity: 5,
      purchasePrice: 21,
      salePrice: 30,
      image: Uint8List.fromList('p01'.codeUnits),
    ),
    Product(
      id: 'a22',
      title: 'Trousers',
      totalQuantity: 120,
      purchasePrice: 41,
      salePrice: 50,
      image: Uint8List.fromList('p02'.codeUnits),
    ),
    Product(
      id: 'a23',
      title: 'Yellow Scarf',
      totalQuantity: 9,
      purchasePrice: 31,
      salePrice: 40,
      image: Uint8List.fromList('p03'.codeUnits),
    ),
    Product(
      id: 'a24',
      title: 'A Pan',
      totalQuantity: 12,
      purchasePrice: 21,
      salePrice: 30,
      image: Uint8List.fromList('p04'.codeUnits),
    ),
    Product(
      id: 'a25',
      title: 'Red Shirts',
      totalQuantity: 5,
      purchasePrice: 21,
      salePrice: 30,
      image: Uint8List.fromList('p01'.codeUnits),
    ),
    Product(
      id: 'a26',
      title: 'Trousers',
      totalQuantity: 120,
      purchasePrice: 41,
      salePrice: 50,
      image: Uint8List.fromList('p02'.codeUnits),
    ),
    Product(
      id: 'a27',
      title: 'Yellow Scarf',
      totalQuantity: 9,
      purchasePrice: 31,
      salePrice: 40,
      image: Uint8List.fromList('p03'.codeUnits),
    ),
    Product(
      id: 'a28',
      title: 'A Pan',
      totalQuantity: 12,
      purchasePrice: 21,
      salePrice: 30,
      image: Uint8List.fromList('p04'.codeUnits),
    ),
    Product(
      id: 'a29',
      title: 'Red Shirts',
      totalQuantity: 5,
      purchasePrice: 21,
      salePrice: 30,
      image: Uint8List.fromList('p01'.codeUnits),
    ),
    Product(
      id: 'a30',
      title: 'Trousers',
      totalQuantity: 120,
      purchasePrice: 41,
      salePrice: 50,
      image: Uint8List.fromList('p02'.codeUnits),
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
      image: product.image,
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

  String _qrId = 'null';
  double _qrTotalQuantity = 0;
  void qrScanning(String data) {
    _qrId = data;
    _qrTotalQuantity = 1;
    notifyListeners();
  }
  String get qrId {
    return _qrId;
  }
  double get qrTotalQuantity {
    return _qrTotalQuantity;
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
