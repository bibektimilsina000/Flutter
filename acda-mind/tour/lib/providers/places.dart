import 'package:flutter/foundation.dart';
import 'package:tour/models/placeModel.dart';
import 'dart:io';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get item {
    return [..._items];
  }

  void addPlace(String title, File image) {
    Place newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        image: image,
        location: Location(longitute: 45, latitute: 45, address: 'unknown'));

    _items.add(newPlace);
    notifyListeners();
  }
}
