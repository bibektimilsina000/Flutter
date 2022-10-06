import 'package:epasal/widgets/cart_icon_and_badge.dart';
import 'package:epasal/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/order.dart' show Orders;
import '../widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  static const routeName = 'order';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text('Your Order'),
        actions: const [CartIconAndBadge()],
      ),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (BuildContext context, int index) {
          return OrderItem(orderData.orders[index]);
        },
      ),
    );
  }
}
