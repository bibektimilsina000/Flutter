import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  var _sectedImage;

  Future<void> selctImage() async {
    final ImagePicker picker = ImagePicker();
    _sectedImage = picker.pickImage(
        source: ImageSource.camera, maxHeight: 600, maxWidth: double.infinity);
  }

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
              onPressed: (() => selctImage()),
              icon: const Icon(Icons.camera_alt_rounded),
              label: const Text('Take Picture'))
        ],
      ),
    );
  }
}
