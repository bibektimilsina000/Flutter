import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import './badge.dart';
import '../screens/cart_screen.dart';

class CartIconAndBadge extends StatelessWidget {
  const CartIconAndBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (_, cart, ch) => Badge(
          value: cart.itemCount.toString(),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: const Icon(Icons.shopping_cart))),
    );
  }
}
