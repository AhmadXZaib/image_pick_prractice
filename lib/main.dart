import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_pick_prractice/screen/ase.dart';
import 'package:image_pick_prractice/screen/camera_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AseScreen());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String? image;
  String? databaseImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImageFromDatabase();
  }

  getImageFromDatabase() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    databaseImage = _prefs.getString('image');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image != null
                      ? FileImage(
                          File(databaseImage!),
                        )
                      : const NetworkImage(
                              'https://images.pexels.com/photos/17820791/pexels-photo-17820791/free-photo-of-woman-in-dress-on-meadow-at-sunset.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')
                          as ImageProvider,
                ),
              ),
            ),
            // ElevatedButton(
            //     onPressed: () async {
            //       ImagePicker _imagePicker = ImagePicker();
            //       final pickImage =
            //           await _imagePicker.pickImage(source: ImageSource.gallery);
            //       image = pickImage!.path;

            //       debugPrint(image);

            //       setState(() {});
            //     },
            //     child: const Text('Pick From Gallery')),
            // ElevatedButton(
            // onPressed: () async {
            //   ImagePicker _imagePicker = ImagePicker();
            //   final pickImage =
            //       await _imagePicker.pickImage(source: ImageSource.camera);
            //   image = pickImage!.path;

            //   debugPrint(image);
            //   setState(() {});
            // },
            // child: const Text('Pick From Camera')),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
