import 'package:flutter/material.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
          child: Container(
        child: const Text('Category item'),
      )),
    );
  }
}
