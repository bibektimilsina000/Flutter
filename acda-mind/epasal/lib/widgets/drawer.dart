import 'package:epasal/providers/auth.dart';
import 'package:epasal/screens/order_screen.dart';
import 'package:epasal/screens/user_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Shop now'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.shopping_basket_sharp),
              title: const Text('Shop'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Payment'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrderScreen.routeName);
              }),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Manage Products'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(UserProductScreen.routeName);
              }),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/');

                Provider.of<Auth>(context, listen: false).signOut();
              }),
        ],
      ),
    );
  }
}
