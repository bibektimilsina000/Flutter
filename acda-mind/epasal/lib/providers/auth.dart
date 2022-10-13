import 'dart:convert';

import 'package:epasal/models/http_exception.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  late String _token = '';
  late DateTime _experyDate;
  late String _userId;

  bool get isAuthenticate {
    return _token != '';
  }

  String get token {
    if (_experyDate.isAfter(DateTime.now()) && _token != '') {
      return _token;
    }
    return '';
  }

  String get userId {
    return _userId;
  }

  Future<void> _authenticate(
      String email, String password, String urlSection) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSection?key=AIzaSyC8yczbfGVTfKrSC1wjwkSnHmzqbHsGkiA';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      var responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _experyDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      _userId = responseData['localId'];
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> signUp(email, password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> signIn(email, password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
