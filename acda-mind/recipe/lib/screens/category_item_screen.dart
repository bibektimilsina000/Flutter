import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../widgets/meal_item.dart';

class CategoryItemList extends StatefulWidget {
  static const routeName = 'category-item-list';

  final List<Meal> availableMeals;
  const CategoryItemList(this.availableMeals);

  @override
  State<CategoryItemList> createState() => _CategoryItemListState();
}

class _CategoryItemListState extends State<CategoryItemList> {
  late String categoryTitle;
  late List<Meal> DisplayedMeal;

  @override
  void didChangeDependencies() {
    final argRoutes =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    categoryTitle = argRoutes['title'] as String;
    String categoryId = argRoutes['id'] as String;

    DisplayedMeal = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      DisplayedMeal.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: DisplayedMeal.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            id: DisplayedMeal[index].id,
            title: DisplayedMeal[index].title,
            imageUrl: DisplayedMeal[index].imageUrl,
            duration: DisplayedMeal[index].duration,
            affordability: DisplayedMeal[index].affordability,
            complexity: DisplayedMeal[index].complexity,
          );
        },
      ),
    );
  }
}
