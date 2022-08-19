import 'package:flutter/material.dart';
import 'package:app1/screens/location_page/text_section.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPAge'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextSection(Colors.red),
          TextSection(Colors.blue),
          TextSection(Colors.green),
        ],
      ),
    );
  }
}
