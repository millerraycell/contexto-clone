import 'package:contexto/constants/colors.dart';
import 'package:contexto/constants/styles.dart';
import 'package:contexto/constants/texts.dart';
import 'package:contexto/screens/home.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ContextoColors.defaultBackground,
      appBar: AppBar(
        backgroundColor: ContextoColors.defaultBackground,
        title: Center(
          child: Text(
            Texts.appBarTitle,
            style: Styles.title,
          ),
        ),
      ),
      body: const Home(),
    );
  }
}
