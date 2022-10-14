import 'dart:convert';

import 'package:epasal/models/http_exception.dart';
import 'package:epasal/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  final String authToken;
  final String userId;

  Orders(this._orders, this.userId, this.authToken);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchOrder() async {
    final url =
        'https://epasal-edd08-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken';

    try {
      final response = await http.get(Uri.parse(url));

      if (json.decode(response.body) == null) {
        throw HttpException('you do not have any orders yet! please add some.');
      }

      final fetchedData = json.decode(response.body) as Map<String, dynamic>;

      if (fetchedData == null) {
        return;
      }

      final List<OrderItem> lodedData = [];

      fetchedData.forEach((orderId, orderData) {
        lodedData.add(
          OrderItem(
            id: orderId,
            amount: orderData['amount'],
            products: (orderData['products'] as List<dynamic>)
                .map((item) => CartItem(
                    id: item['id'],
                    title: item['title'],
                    quantity: item['quantity'],
                    price: item['price']))
                .toList(),
            dateTime: DateTime.parse(
              orderData['dateTime'],
            ),
          ),
        );
      });

      _orders = lodedData.reversed.toList();
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addOrder(double total, List<CartItem> cartProducts) async {
    final url =
        'https://epasal-edd08-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken';
    final timeStamp = DateTime.now();
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'amount': total,
            'dateTime': timeStamp.toIso8601String(),
            'products': cartProducts
                .map((cartProduct) => {
                      'id': cartProduct.id,
                      'title': cartProduct.title,
                      'quantity': cartProduct.quantity,
                      'price': cartProduct.price,
                    })
                .toList()
          }));
      _orders.insert(
        0,
        OrderItem(
          id: json.decode(response.body)['name'],
          amount: total,
          products: cartProducts,
          dateTime: timeStamp,
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  void deleteOrder(String id) {
    _orders.removeWhere((element) => element.id == id);

    notifyListeners();
  }
}
