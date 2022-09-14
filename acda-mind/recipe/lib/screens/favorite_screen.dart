import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

class Favorite extends StatelessWidget {
  List favMeal;
  Favorite(this.favMeal);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favMeal.length,
      itemBuilder: (BuildContext context, int index) {
        return MealItem(
          id: favMeal[index].id,
          title: favMeal[index].title,
          imageUrl: favMeal[index].imageUrl,
          duration: favMeal[index].duration,
          affordability: favMeal[index].affordability,
          complexity: favMeal[index].complexity,
        );
      },
    );
  }
}
