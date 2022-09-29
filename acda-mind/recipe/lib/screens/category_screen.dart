import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

import '../widgets/category_items.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2.35,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        children: <Widget>[
          ...DUMMY_CATEGORIES
              .map((data) => CategoryItems(
                    data.id,
                    data.title,
                    data.color,
                    data.imageUrl,
                  ))
              .toList()
        ],
      ),
    );
  }
}
