import 'package:epasal/models/http_exception.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];
  final String authToken;
  String userId;

  Products(this.authToken, this.userId, this._items);

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFav).toList();
  }

  // void showFavoriteItem() {
  //   _showFavoriteOnly = true;
  //   notifyListeners();
  // }

  // void showAllItem() {
  //   _showFavoriteOnly = false;
  //   notifyListeners();
  // }

  Product getById(id) {
    return _items.firstWhere((element) => element.id == id);
  }

  Future<void> fetchProduct([bool filterByUser = false]) async {
    var filterString = filterByUser ? 'orderBy="userId"&equalTo="$userId"' : '';
    var url =
        'https://epasal-edd08-default-rtdb.firebaseio.com/product.json?auth=$authToken&$filterString';
    try {
      final response = await http.get(Uri.parse(url));

      final exatractedData = json.decode(response.body) as Map<String, dynamic>;

      if (exatractedData == null) {
        return;
      }

      url =
          'https://epasal-edd08-default-rtdb.firebaseio.com/userFavorite/$userId.json?auth=$authToken';
      final favResponse = await http.get(Uri.parse(url));

      final favData = json.decode(favResponse.body);

      final List<Product> lodedProduct = [];

      exatractedData.forEach(
        (prodId, prodData) {
          lodedProduct.add(Product(
            id: prodId,
            title: prodData['title'],
            description: prodData['description'],
            price: prodData['price'],
            imageUrl: prodData['imageUrl'],
            isFav: favData == null ? false : favData[prodId] ?? false,
          ));
        },
      );

      _items = lodedProduct;

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    final url =
        'https://epasal-edd08-default-rtdb.firebaseio.com/product.json?auth=$authToken';

    try {
      var response = await http.post(Uri.parse(url),
          body: json.encode({
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'imageUrl': product.imageUrl,
            'userId': userId,
          }));

      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );

      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final productIndex = _items.indexWhere((element) => element.id == id);

    try {
      final url =
          'https://epasal-edd08-default-rtdb.firebaseio.com/product/${id}.json?auth=$authToken';

      await http.patch(Uri.parse(url),
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'price': newProduct.price,
            'imageUrl': newProduct.imageUrl,
          }));
      _items[productIndex] = newProduct;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> deleteProduct(String id) async {
    final url =
        'https://epasal-edd08-default-rtdb.firebaseio.com/product/${id}.json?auth=$authToken';

    final response = await http.delete(Uri.parse(url));
    if (response.statusCode >= 400) {
      throw HttpException('Sorry,could not delete product');
    } else {
      _items.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }
}
