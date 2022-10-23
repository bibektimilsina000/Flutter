import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  var _sectedImage;

  Future<void> selctImage() async {
    final ImagePicker picker = ImagePicker();
    var pickedImage = await picker.pickImage(
        source: ImageSource.camera, maxHeight: 600, maxWidth: double.infinity);
    setState(() {
      _sectedImage = File(pickedImage!.path);
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();

    final fileName = path.basename(appDir.path);

    final savedImage = _sectedImage.copy('${appDir.path}/$fileName');
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
                : Image.file(
                    _sectedImage,
                    fit: BoxFit.cover,
                  ),
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
