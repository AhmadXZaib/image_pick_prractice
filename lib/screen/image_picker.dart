import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

String? image;
String? databaseimage;

class _ImagePickerScreenState extends State<ImagePickerScreen> {
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
                    image: databaseimage != null
                        ? FileImage(
                            File(databaseimage!),
                          )
                        : const NetworkImage(
                            'https://images.pexels.com/photos/17820791/pexels-photo-17820791/free-photo-of-woman-in-dress-on-meadow-at-sunset.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                          ) as ImageProvider),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                ImagePicker _imagePicker = ImagePicker();

                final pickImage =
                    await _imagePicker.pickImage(source: ImageSource.gallery);
                databaseimage = pickImage!.path;
                setState(() {});
              },
              child: const Text('Pick From gallery'))
        ],
      ),
    );
  }
}
