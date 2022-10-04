import 'package:epasal/providers/cart.dart';
import 'package:epasal/widgets/cart_icon_and_badge.dart';

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
        actions: const [CartIconAndBadge()],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Image.network(
                  lodedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(lodedProduct.title),
                      Text('Rs: ${lodedProduct.price}')
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(lodedProduct.description),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false).addItem(
                                productId,
                                lodedProduct.title,
                                lodedProduct.price);
                          },
                          child: const Text('Add to cart')),
                      OutlinedButton(
                          onPressed: () {}, child: const Text('Buy Now'))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
