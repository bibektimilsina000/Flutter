import 'package:flutter/material.dart';

import '../models/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = 'meal-detail';

  Widget titleBuilder(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (element) => element.id == mealId,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(),
              ),
              child: Column(
                children: [
                  titleBuilder(context, 'Ingredients'),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    padding: const EdgeInsets.all(5),
                    height: 200,
                    width: 300,
                    child: ListView.builder(
                      itemCount: selectedMeal.ingredients.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Card(
                            color: Theme.of(context).colorScheme.secondary,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                selectedMeal.ingredients[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(),
              ),
              child: Column(
                children: [
                  titleBuilder(context, 'Steps'),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    padding: const EdgeInsets.all(5),
                    height: 200,
                    width: 300,
                    child:ListView.builder(
                      itemCount: selectedMeal.steps.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ;
                      },
                    ), ,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
