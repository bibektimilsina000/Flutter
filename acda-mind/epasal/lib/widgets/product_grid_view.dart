import 'package:flutter/material.dart';

import '../models/products.dart';

class ProductGridView extends StatelessWidget {
  final List<Product> lodedProducts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: lodedProducts.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetail.routeName,
                arguments: lodedProducts[index].id);
          },
          child: ProductItem(
              id: lodedProducts[index].id,
              title: lodedProducts[index].title,
              description: lodedProducts[index].description,
              price: lodedProducts[index].price,
              imageUrl: lodedProducts[index].imageUrl),
        );
      },
    );
  }
}
