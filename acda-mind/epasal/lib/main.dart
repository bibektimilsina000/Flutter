import 'package:epasal/providers/auth.dart';
import 'package:epasal/providers/order.dart';
import 'package:epasal/screens/auth_screen.dart';
import 'package:epasal/screens/cart_screen.dart';
import 'package:epasal/screens/edit_product_screen.dart';
import 'package:epasal/screens/user_product.dart';

import '/providers/cart.dart';
import '/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_overview.dart';
import './screens/detail_product.dart';
import './screens/order_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Products()),
          ChangeNotifierProvider(create: (context) => Cart()),
          ChangeNotifierProvider(create: (context) => Orders()),
          ChangeNotifierProvider(create: (context) => Auth())
        ],
        child: Consumer<Auth>(
          builder: (context, auth, child) => MaterialApp(
            debugShowMaterialGrid: false,
            debugShowCheckedModeBanner: false,
            title: 'ePasal',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
                    .copyWith(secondary: Colors.yellow)),
            home: auth.isAuthenticate ? ProductOverview() : AuthScreen(),
            routes: {
              ProductOverview.routeName: (context) => const ProductOverview(),
              ProductDetail.routeName: (context) => const ProductDetail(),
              CartScreen.routeName: (context) => CartScreen(),
              OrderScreen.routeName: (context) => const OrderScreen(),
              UserProductScreen.routeName: (context) =>
                  const UserProductScreen(),
              EditProductScreen.routeName: (context) =>
                  const EditProductScreen(),
            },
          ),
        ));
  }
}
