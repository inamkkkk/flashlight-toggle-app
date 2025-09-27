import 'package:flutter/material.dart';
import 'package:flashlight_app/screens/flashlight_screen.dart';
import 'package:provider/provider.dart';
import 'package:flashlight_app/models/flashlight_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => FlashlightModel(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashlight App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FlashlightScreen(),
    );
  }
}