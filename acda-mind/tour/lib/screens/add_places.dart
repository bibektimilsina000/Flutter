import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour/providers/places.dart';
import 'package:tour/widgets/add_image.dart';
import 'package:tour/widgets/locationPick.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleControler = TextEditingController();
  var _pickedImage;

  void _pickImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(label: Text('Title')),
                  controller: _titleControler,
                ),
              ),
              AddImage(_pickImage),
              const SizedBox(
                height: 10,
              ),
              const LocationPick()
            ],
          )),
          ElevatedButton.icon(
            onPressed: () {
              if (_pickedImage == null) {
                return;
              }
              Provider.of<GreatPlaces>(context, listen: false)
                  .addPlace(_titleControler.text, _pickedImage);
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Place'),
          ),
        ],
      ),
    );
  }
}
