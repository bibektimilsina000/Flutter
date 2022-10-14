import 'package:epasal/providers/auth.dart';
import 'package:epasal/providers/order.dart';
import 'package:epasal/screens/277%20splash_screen.dart';
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
          ChangeNotifierProvider(create: (context) => Auth()),
          ChangeNotifierProxyProvider<Auth, Products>(
            create: (context) => Products('', '', []),
            update: (context, auth, previous) => Products(auth.token.toString(),
                auth.userId, previous!.items == null ? [] : previous.items),
          ),
          ChangeNotifierProvider(create: (context) => Cart()),
          ChangeNotifierProxyProvider<Auth, Orders>(
            create: (context) => Orders([], '', ''),
            update: (context, auth, previous) => Orders(
                previous!.orders == null ? [] : previous.orders,
                auth.userId,
                auth.token.toString()),
          ),
        ],
        child: Consumer<Auth>(
          builder: (context, auth, child) => MaterialApp(
            debugShowMaterialGrid: false,
            debugShowCheckedModeBanner: false,
            title: 'ePasal',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
                    .copyWith(secondary: Colors.yellow)),
            home: auth.isAuthenticate
                ? ProductOverview()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) =>
                        snapshot.connectionState == ConnectionState.waiting
                            ? SplashScreen()
                            : AuthScreen()),
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
