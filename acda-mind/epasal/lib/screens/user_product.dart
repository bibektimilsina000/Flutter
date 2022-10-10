import 'package:epasal/providers/products.dart';
import 'package:epasal/screens/edit_product_screen.dart';
import 'package:epasal/widgets/drawer.dart';
import 'package:epasal/widgets/user_product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = 'user-product';
  const UserProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          Navigator.of(context)
              .pushNamed(EditProductScreen.routeName, arguments: 'add');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: 'add');
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: const DrawerScreen(),
      body: ListView.builder(
        itemCount: productsData.items.length,
        itemBuilder: (BuildContext context, int index) {
          return UserProductItem(
              productsData.items[index].id,
              productsData.items[index].title,
              productsData.items[index].imageUrl);
        },
      ),
    );
  }
}
