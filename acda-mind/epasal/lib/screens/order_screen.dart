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
    return Scaffold(
        drawer: const DrawerScreen(),
        appBar: AppBar(
          title: const Text('Your Order'),
          actions: const [CartIconAndBadge()],
        ),
        body: FutureBuilder(
          future: Provider.of<Orders>(context, listen: false).fetchOrder(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.error != null) {
                var errorMsg = snapshot.error.toString();

                return Center(
                  child: errorMsg.contains('any orders')
                      ? Text(snapshot.error.toString())
                      : Text(
                          'Error occurs! check your internet connection and try later.'),
                );
              } else {
                return Consumer<Orders>(
                  builder: (context, orderData, child) => ListView.builder(
                    itemCount: orderData.orders.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OrderItem(
                          orderData.orders[index].id, orderData.orders[index]);
                    },
                  ),
                );
              }
            }
          },
        ));
  }
}
