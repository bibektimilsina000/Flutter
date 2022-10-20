import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour/providers/places.dart';
import 'package:tour/screens/places_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      child: MaterialApp(
        title: 'tour',
        theme: ThemeData(
            colorScheme:
                ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          secondary: Colors.pink,
        )),
        home: const PlaceListScreen(),
      ),
    );
  }
}
