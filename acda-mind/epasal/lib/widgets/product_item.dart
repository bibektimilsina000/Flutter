import 'package:epasal/providers/cart.dart';
import 'package:epasal/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/detail_product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductDetail.routeName, arguments: product.id);
      },
      child: GridTile(
        footer: GridTileBar(
          title: Text(product.title),
          backgroundColor: Colors.black54,
          leading: IconButton(
              onPressed: (() {
                product.toggleFavoriteStatus();
              }),
              icon: Icon(
                product.isFav ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).colorScheme.secondary,
              )),
          trailing: IconButton(
            onPressed: () {
              cart.addItem(product.id, product.title, product.price);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();

              final snackBar = SnackBar(
                duration: const Duration(milliseconds: 1000),
                backgroundColor: Theme.of(context).colorScheme.primary,
                content: const Text('Product Added to Cart'),
                action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    }),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
