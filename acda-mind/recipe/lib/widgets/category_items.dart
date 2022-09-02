import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItems(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Text(title),
    );
  }
}
