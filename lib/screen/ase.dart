import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AseScreen extends StatefulWidget {
  const AseScreen({super.key});

  @override
  State<AseScreen> createState() => _AseScreenState();
}

String? image;

class _AseScreenState extends State<AseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: image != null
                        ? FileImage(File(image!))
                        : const NetworkImage(
                                'https://images.pexels.com/photos/18138908/pexels-photo-18138908/free-photo-of-cute-cat-on-window.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')
                            as ImageProvider)),
          ),
          ElevatedButton(
            onPressed: () async {
              ImagePicker _imagePicker = ImagePicker();
              final pickimage =
                  await _imagePicker.pickImage(source: ImageSource.gallery);
              image = pickimage!.path;
              setState(() {});
            },
            child: const Text('Pick Image'),
          ),
        ],
      ),
    );
  }
}
