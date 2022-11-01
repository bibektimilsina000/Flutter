import 'package:flutter/foundation.dart';
import 'package:tour/models/placeModel.dart';
import 'dart:io';

import '../helpers/db_helper.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

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

    DbHelper.insert('Places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> getPlaces() async {
    final retriveData = await DbHelper.getData('Places');
    _items = retriveData
        .map((place) => Place(
            id: place['id'],
            title: place['title'],
            image: File(place['image']),
            location: Location(longitute: 000, latitute: 000, address: 'null')))
        .toList();
    notifyListeners();
  }
}
