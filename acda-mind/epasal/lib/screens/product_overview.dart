import 'package:epasal/providers/cart.dart';
import 'package:epasal/screens/cart_screen.dart';
import 'package:epasal/widgets/badge.dart';
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
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
                value: cart.itemCount.toString(),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                    icon: const Icon(Icons.shopping_cart))),
          )
        ],
      ),
      body: ProductGridView(showOnlyFavorite),
    );
  }
}
