import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class CameraPickerScreen extends StatefulWidget {
  const CameraPickerScreen({super.key});

  @override
  State<CameraPickerScreen> createState() => _CameraPickerScreenState();
}

String? image;

class _CameraPickerScreenState extends State<CameraPickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: image != null
                        ? FileImage(
                            File(image!),
                          )
                        : const NetworkImage('url') as ImageProvider),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                ImagePicker _imagePicker = ImagePicker();

                final pickImage =
                    await _imagePicker.pickImage(source: ImageSource.camera);
                image = pickImage!.path;
                setState(() {});
              },
              child: const Text('pick image '))
        ],
      ),
    );
  }
}
