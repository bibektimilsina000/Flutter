import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const routerName = '/filter';
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Filter screeen'),
      ),
    );
  }
}
