import 'package:flutter/material.dart';

import '../widgets/product_grid_view.dart';

enum FilterOptions {
  favorites,
  all,
}

void main() => runApp(const ProductOverview());

class ProductOverview extends StatelessWidget {
  const ProductOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ePasal'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 0,
                child: Text('Only Favorite'),
              ),
              const PopupMenuItem(
                value: 1,
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
