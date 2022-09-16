import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

class Favorite extends StatelessWidget {
  List favMeal;
  Favorite(this.favMeal);

  @override
  Widget build(BuildContext context) {
    return favMeal.isEmpty
        ? Center(
            child: Container(
              child: Text(
                "You have no favroite yet, Start adding some!",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          )
        : ListView.builder(
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
