import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map httpResponse = {};

  Future fetchData() async {
    http.Response response;

    response = await http
        .get(Uri.parse('https://www.thegrowingdeveloper.org/apiview?id=2'));

    if (response.statusCode == 200) {
      setState(() {
        httpResponse = jsonDecode(response.body);
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Text(httpResponse['facts'][2]['title'].toString()),
        ),
      ),
    );
  }
}
