import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  static const mealDetail = 'meal-detail';

  @override
  Widget build(BuildContext context) {
    final argRoutes =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final String title = argRoutes['title'] as String;
    final String imageUrl = argRoutes['imageUrl'] as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(imageUrl),
            ),
          ),
          Container(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
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
