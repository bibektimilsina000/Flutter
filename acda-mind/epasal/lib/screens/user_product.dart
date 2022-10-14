import 'package:epasal/providers/products.dart';
import 'package:epasal/screens/edit_product_screen.dart';
import 'package:epasal/widgets/drawer.dart';
import 'package:epasal/widgets/user_product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = 'user-product';
  const UserProductScreen({super.key});

  Future<void> _refreshProduct(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchProduct(true);
  }

  @override
  Widget build(BuildContext context) {
    // final productsData = Provider.of<Products>(context);

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
      body: FutureBuilder(
        future: _refreshProduct(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : RefreshIndicator(
                    onRefresh: () => _refreshProduct(context),
                    child: Consumer<Products>(
                      builder: (context, productsData, child) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: productsData.items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return UserProductItem(
                                productsData.items[index].id,
                                productsData.items[index].title,
                                productsData.items[index].imageUrl);
                          },
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
