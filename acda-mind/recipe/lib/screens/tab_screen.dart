import 'package:flutter/material.dart';
import '../models/meal.dart';

import 'category_screen.dart';
import 'favorite_screen.dart';
import '/widgets/main_drawer.dart';

class Tabs extends StatefulWidget {
  List<Meal> favMeal;

  Tabs(this.favMeal);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final List<Map<String, dynamic>> _pages = [
    {'pages': const Category(), 'title': 'Category'},
    {'pages': const Favorite(), 'title': 'Your Favorite'},
  ];

  int _selectPageIndex = 0;

  void _selectPage(index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectPageIndex]['pages'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
