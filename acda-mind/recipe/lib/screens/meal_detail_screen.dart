import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  static const routeName = 'meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            child: const Text(
              'stau',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          Container(
            child: Column(),
          )
        ],
      ),
    );
  }
}
