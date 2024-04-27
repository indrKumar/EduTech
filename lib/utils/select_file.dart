import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickFileOrTakePhoto(BuildContext context) async {
  try {
    final action = await showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Choose an option'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop('file');
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Pick File', style: TextStyle(color: Colors.white)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop('camera');
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Using camera', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );

    if (action == 'file') {
      // Pick a file
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'pdf', 'doc', 'docx', 'xls', 'xlsx'],
      );

      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      }
    } else if (action == 'camera') {
      // Take a photo
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        return File(image.path);
      }
    }
  } catch (e) {
    print("Error: $e");
    Fluttertoast.showToast(msg: "Error occurred");
  }

  return null;
}
