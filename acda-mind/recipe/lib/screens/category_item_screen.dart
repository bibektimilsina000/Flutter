import 'package:flutter/material.dart';

import '../models/dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryItemList extends StatelessWidget {
  static const categoryItemList = 'category-item-list';
  // final String categoryId;
  // final String categoryTitle;
  // final Color categoryColor;

  // const CategoryItemList(
  //   this.categoryId,
  //   this.categoryTitle,
  //   this.categoryColor,
  // );

  @override
  Widget build(BuildContext context) {
    final argRoutes =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    String categoryTitle = argRoutes['title'] as String;
    String categoryId = argRoutes['id'] as String;

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
          );
        },
      ),
    );
  }
}
