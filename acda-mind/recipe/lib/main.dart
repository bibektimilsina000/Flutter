import 'package:flutter/material.dart';

import '/models/dummy_data.dart';
import '/models/meal.dart';

import '../screens/filter_screen.dart';
import '../screens/tab_screen.dart';
import '../screens/category_item_screen.dart';
import 'screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'Gluten': false,
    'Vegan': false,
    'Vegetarian': false,
    'LactoseFree': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favMeal = [];

  void touglefav(String id) {
    final existingId = favMeal.indexWhere((element) => element.id == id);

    if (existingId >= 0) {
      setState(() {
        favMeal.removeAt(existingId);
      });
    } else {
      setState(() {
        favMeal.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    }
  }

  bool isInFav(String id) {
    return favMeal.any((element) => element.id == id);
  }

  void _setFilters(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;
      availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['Gluten'] == true && !element.isGlutenFree) {
          return false;
        }
        if (_filters['Vegan'] == true && !element.isVegan) {
          return true;
        }
        if (_filters['Vegetarian'] == true && !element.isVegetarian) {
          return false;
        }
        if (_filters['LactoseFree'] == true && !element.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline1: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto')),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber)),
      routes: {
        '/': (context) => Tabs(favMeal),
        CategoryItemList.routeName: (context) =>
            CategoryItemList(availableMeals),
        MealDetail.routeName: (context) => MealDetail(touglefav, isInFav),
        FiltersScreen.routerName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
    );
  }
}
