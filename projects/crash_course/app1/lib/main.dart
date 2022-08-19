import 'package:flutter/material.dart';
import 'screens/location_page/location_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Detail_app',
      home: Location(),
    );
  }
}
