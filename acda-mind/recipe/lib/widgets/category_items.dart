import 'package:flutter/material.dart';

class CategoryItems extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItems(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [color, color.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Text(title, style: Theme.of(context).textTheme.headline1),
      ),
    );
  }
}
