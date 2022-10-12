import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _experyDate;
  late String _userId;

  Future<void> _authenticate(
      String email, String password, String urlSection) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSection?key=AIzaSyC8yczbfGVTfKrSC1wjwkSnHmzqbHsGkiA';

    final response = await http.post(Uri.parse(url),
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    print(json.decode(response.body));
  }

  Future<void> signUp(email, password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> signIn(email, password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
