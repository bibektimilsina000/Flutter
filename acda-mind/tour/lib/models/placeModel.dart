import 'dart:io';

class Location {
  final double longitute;
  final double latitute;
  final String address;
  Location({
    required this.longitute,
    required this.latitute,
    required this.address,
  });
}

class Place {
  final String id;
  final String title;
  final File image;
  final Location location;

  Place({
    required this.id,
    required this.title,
    required this.image,
    required this.location,
  });
}
