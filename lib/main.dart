// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const platform = MethodChannel('samples.flutter.dev/flashlight');

  const MyApp({super.key});

  Future<void> _toggleFlashlight() async {
    try {
      await platform.invokeMethod('toggleFlashlight');
    } on PlatformException catch (e) {
      print("Failed to toggle flashlight: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 6, 53, 93),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 53, 93),
          centerTitle: true,
          title: const Text(
            'Fanar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _toggleFlashlight,
            child: const Text('On/Off'),
          ),
        ),
      ),
    );
  }
}
