import 'package:flutter/material.dart';
import 'package:flutter_water_intake/pages/home.dart';
import 'package:flutter_water_intake/provider/water_model_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (BuildContext context) => WaterModel(),
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Intaker',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 59, 184, 201)),
      ),
      home: HomePage(),
    );
  }
}



