import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour/providers/places.dart';
import 'package:tour/screens/add_places.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (context, places, ch) => places.item.isEmpty
            ? const Center(
                child: Text('No place added yet!'),
              )
            : ListView.builder(
                itemCount: places.item.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: FileImage(places.item[index].image)),
                    title: Text(places.item[index].title),
                  );
                },
              ),
      ),
    );
  }
}
