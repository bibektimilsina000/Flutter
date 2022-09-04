import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The recipe'),
      ),
      body: Center(
          child: Container(
        child: const Text('Category item'),
      )),
    );
  }
}
