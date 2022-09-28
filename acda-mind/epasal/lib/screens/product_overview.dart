import 'package:flutter/material.dart';

import '../widgets/product_grid_view.dart';

void main() => runApp(const ProductOverview());

class ProductOverview extends StatelessWidget {
  const ProductOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ePasal'),
      ),
      body: const ProductGridView(),
    );
  }
}
