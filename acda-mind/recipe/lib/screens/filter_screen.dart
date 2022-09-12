import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routerName = '/filter';

  final savefilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.savefilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;

  @override
  void initState() {
    isGlutenFree = widget.currentFilters['Gluten'] as bool;
    isVegan = widget.currentFilters['Vegan'] as bool;
    isVegetarian = widget.currentFilters['Vegetarian'] as bool;
    isLactoseFree = widget.currentFilters['LactoseFree'] as bool;
    super.initState();
  }

  Widget _switchBuilder(
    String title,
    String subtitle,
    bool currentValue,
    updateValue,
  ) {
    return SwitchListTile.adaptive(
      value: currentValue,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
      subtitle: Text(subtitle),
      onChanged: updateValue,
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'Gluten': isGlutenFree,
                    'Vegan': isVegan,
                    'Vegetarian': isVegetarian,
                    'LactoseFree': isLactoseFree,
                  };

                  widget.savefilters(selectedFilters);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Filters Recipe',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _switchBuilder(
                  "Gluteen Free",
                  'Only include gluteen free recipe ',
                  isGlutenFree,
                  (value) {
                    setState(() {
                      isGlutenFree = value;
                    });
                  },
                ),
                _switchBuilder(
                  "Vegetarian",
                  'Only include vegetarian recipe ',
                  isVegetarian,
                  (value) {
                    setState(() {
                      isVegetarian = value;
                    });
                  },
                ),
                _switchBuilder(
                  "Vegan",
                  'Only include Vegan recipe ',
                  isVegan,
                  (value) {
                    setState(() {
                      isVegan = value;
                    });
                  },
                ),
                _switchBuilder(
                  "Lactose Free",
                  'Only include lactose free recipe ',
                  isLactoseFree,
                  (value) {
                    setState(() {
                      isLactoseFree = value;
                    });
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
