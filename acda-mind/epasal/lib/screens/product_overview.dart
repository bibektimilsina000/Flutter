import 'package:flutter/material.dart';

import '../widgets/product_grid_view.dart';

void main() => runApp(ProductOverview());

class ProductOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ePasal'),
      ),
      body: ProductGridView(),
    );
  }
}
