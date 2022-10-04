import 'package:epasal/screens/cart_screen.dart';

import '/providers/cart.dart';
import '/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_overview.dart';
import './screens/detail_product.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Cart())
      ],
      child: MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        title: 'ePasal',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
                .copyWith(secondary: Colors.yellow)),
        routes: {
          '/': (context) => ProductOverview(),
          ProductDetail.routeName: (context) => const ProductDetail(),
          CartScreen.routeName: (context) => const CartScreen()
        },
      ),
    );
  }
}
