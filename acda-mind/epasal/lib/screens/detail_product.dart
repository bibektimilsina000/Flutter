import '/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  static const routeName = 'detail-product';

  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;

    final lodedProduct =
        Provider.of<Products>(context, listen: false).getById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(lodedProduct.title),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
