import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;

  const CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: FittedBox(
                child: Text(
              'Rs $price',
              style: const TextStyle(color: Colors.white),
            )),
          ),
        ),
        title: Text(title),
        subtitle: Text('Total: Rs ${(price * quantity)}'),
        trailing: Text('$quantity x'),
      ),
    );
  }
}
