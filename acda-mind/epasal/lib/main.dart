import 'package:flutter/material.dart';

import './screens/product_overview.dart';
import './screens/detail_product.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
              .copyWith(secondary: Colors.yellow)),
      routes: {
        '/': (context) => ProductOverview(),
        ProductDetail.routeName: (context) => const ProductDetail()
      },
    );
  }
}
