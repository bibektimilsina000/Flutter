import 'package:flutter/material.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  var _sectedImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 100,
            width: 150,
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            child: _sectedImage == null
                ? const Center(
                    child: Text('No Image Selected'),
                  )
                : Image.file(_sectedImage),
          ),
          TextButton.icon(
              onPressed: (() {}),
              icon: const Icon(Icons.camera_alt_rounded),
              label: const Text('Take Picture'))
        ],
      ),
    );
  }
}
