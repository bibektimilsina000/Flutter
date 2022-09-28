import 'package:flutter/material.dart';

import '../models/products.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  void addProduct() {
    // items.add();
    notifyListeners();
  }
}
