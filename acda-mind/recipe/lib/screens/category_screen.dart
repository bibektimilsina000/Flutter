import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

import '../widgets/category_items.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: <Widget>[
        ...DUMMY_CATEGORIES
            .map((data) => CategoryItems(
                  data.title,
                  data.color,
                ))
            .toList()
      ],
    );
  }
}
