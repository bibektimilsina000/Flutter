import 'package:epasal/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_overview.dart';
import './screens/detail_product.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        title: 'ePasal',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
                .copyWith(secondary: Colors.yellow)),
        routes: {
          '/': (context) => const ProductOverview(),
          ProductDetail.routeName: (context) => const ProductDetail()
        },
      ),
    );
  }
}
