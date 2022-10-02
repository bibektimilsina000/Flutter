import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/products.dart';
import '../widgets/product_item.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final product = productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: product.length,
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider.value(
          value: product[index],
          child: const ProductItem(),
        );
      },
    );
  }
}
