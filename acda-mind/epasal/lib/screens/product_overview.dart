import 'package:epasal/widgets/cart_icon_and_badge.dart';
import 'package:flutter/material.dart';

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
          const CartIconAndBadge()
        ],
      ),
      drawer: ,
      body: ProductGridView(showOnlyFavorite),
    );
  }
}
