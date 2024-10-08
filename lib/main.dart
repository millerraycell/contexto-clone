import 'package:contexto/constants/texts.dart';
import 'package:contexto/screens/body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Texts.appName,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Body(),
    );
  }
}
