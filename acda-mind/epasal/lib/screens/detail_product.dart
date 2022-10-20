import 'package:epasal/providers/cart.dart';

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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(color: Colors.green),
                child: Text(lodedProduct.title),
              ),
              background: Hero(
                tag: lodedProduct.id,
                child: Image.network(
                  lodedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Rs: ${lodedProduct.price}',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(lodedProduct.description),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Provider.of<Cart>(context, listen: false)
                                      .addItem(productId, lodedProduct.title,
                                          lodedProduct.price);
                                },
                                child: const Text('Add to cart')),
                            OutlinedButton(
                                onPressed: () {}, child: const Text('Buy Now'))
                          ],
                        ),
                        SizedBox(
                          height: 900,
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
