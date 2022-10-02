import 'package:flutter/material.dart';

import '../widgets/product_grid_view.dart';

enum FilterOptions {
  favorites,
  all,
}

void main() => runApp(ProductOverview());

class ProductOverview extends StatefulWidget {
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
              if (value == FilterOptions.favorites) {
                setState(() {
                  showOnlyFavorite = true;
                });
              } else {
                setState(() {
                  showOnlyFavorite = false;
                });
              }
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
          )
        ],
      ),
      body: ProductGridView(showOnlyFavorite),
    );
  }
}
