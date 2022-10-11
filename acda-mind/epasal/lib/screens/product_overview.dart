import 'package:epasal/providers/products.dart';
import 'package:epasal/widgets/cart_icon_and_badge.dart';
import 'package:epasal/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_grid_view.dart';

enum FilterOptions {
  favorites,
  all,
}

void main() => runApp(const ProductOverview());

class ProductOverview extends StatefulWidget {
  const ProductOverview({super.key});

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  bool showOnlyFavorite = false;
  bool isLoading = false;
  @override
  void initState() {
    setState(() {
      isLoading = true;
    });

    Provider.of<Products>(context, listen: false).fetchProduct().then((value) {
      setState(() {
        isLoading = false;
      });
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('An error occur!'),
          content: Text('try checking your internet connection.'),
          actions: [
            TextButton(onPressed: () {}, child: Text('Quite')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Retry')),
          ],
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ePasal'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions value) {
              setState(() {
                if (value == FilterOptions.favorites) {
                  showOnlyFavorite = true;
                } else {
                  showOnlyFavorite = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text('Only Favorite'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Show All'),
              )
            ],
          ),
          const CartIconAndBadge()
        ],
      ),
      drawer: const DrawerScreen(),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductGridView(showOnlyFavorite),
    );
  }
}
