import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationPick extends StatefulWidget {
  const LocationPick({super.key});

  @override
  State<LocationPick> createState() => _LocationPickState();
}

class _LocationPickState extends State<LocationPick> {
  var locationPrevewUrl;

  Future<void> getCurrentLocation() async {
    final currentLocation = await Location.instance.getLocation();
    print(currentLocation.longitude);
    print(currentLocation.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: locationPrevewUrl == null
                ? const Center(
                    child: Text(
                      'Choose a location',
                      textAlign: TextAlign.center,
                    ),
                  )
                : Image.network(locationPrevewUrl),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: getCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: const Text('choose on map'),
            )
          ],
        )
      ],
    );
  }
}
