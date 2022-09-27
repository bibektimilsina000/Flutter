import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = 'detail-product';

  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
