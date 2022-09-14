import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  List favMeal;
  Favorite(this.favMeal);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('your fav'),
    );
  }
}
