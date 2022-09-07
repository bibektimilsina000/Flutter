import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  static const mealDetail = 'meal-detail';

  @override
  Widget build(BuildContext context) {
    final argRoutes =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    return Center(
      child: Container(
        child: const Text('this is detail page of slected meal'),
      ),
    );
  }
}
