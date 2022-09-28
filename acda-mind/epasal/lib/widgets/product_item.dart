import 'package:flutter/material.dart';
import '../screens/detail_product.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  const ProductItem({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetail.routeName, arguments: id);
      },
      child: GridTile(
        footer: GridTileBar(
          title: Text(title),
          backgroundColor: Colors.black54,
          leading: IconButton(
              onPressed: (() {}),
              icon: Icon(
                Icons.favorite,
                color: Theme.of(context).colorScheme.secondary,
              )),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
