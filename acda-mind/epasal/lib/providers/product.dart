import 'dart:convert';

import 'package:epasal/models/http_exception.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFav;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFav = false,
  });

  Future<void> toggleFavoriteStatus(String authToken, String userId) async {
    final url =
        'https://epasal-edd08-default-rtdb.firebaseio.com/userFavorite/$userId/${id}.json?auth=$authToken';
    bool oldStatus = isFav;

    try {
      isFav = !isFav;
      notifyListeners();

      final response = await http.put(
        Uri.parse(url),
        body: json.encode(
          isFav,
        ),
      );

      if (response.statusCode >= 300) {
        isFav = oldStatus;
        notifyListeners();
        throw HttpException('Sorry! Something went wrong.');
      }
    } catch (error) {
      throw error;
    }
  }
}
