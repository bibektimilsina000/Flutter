import 'package:flutter/foundation.dart';
import 'package:tour/models/placeModel.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get item {
    return [..._items];
  }
}
