import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_grid_view.dart';
import '../providers/products.dart';

enum FilterOptions {
  favorites,
  all,
}

void main() => runApp(const ProductOverview());

class ProductOverview extends StatelessWidget {
  const ProductOverview({super.key});

  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ePasal'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions value) {
              if (value == FilterOptions.favorites) {
                productData.showFavoriteItem();
              } else {
                productData.showAllItem();
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
      body: const ProductGridView(),
    );
  }
}
