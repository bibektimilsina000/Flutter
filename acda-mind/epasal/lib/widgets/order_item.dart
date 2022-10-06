import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/order.dart' as or;

class OrderItem extends StatelessWidget {
  final or.OrderItem order;

  const OrderItem(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text('Rs: ${order.amount}'),
        subtitle: Text(DateFormat('dd mm yyyy hh:mm').format(order.dateTime)),
        trailing:
            IconButton(onPressed: () {}, icon: const Icon(Icons.expand_more)),
      ),
    );
  }
}
