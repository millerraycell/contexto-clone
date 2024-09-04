import 'package:contexto/constants/colors.dart';
import 'package:contexto/constants/styles.dart';
import 'package:contexto/constants/texts.dart';
import 'package:contexto/screens/home.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ContextoColors.defaultBackground,
      appBar: AppBar(
        backgroundColor: ContextoColors.defaultBackground,
        actions: [
          PopupMenuButton<String>(
            color: ContextoColors.defaultBackground,
            initialValue: selectedItem,
            onSelected: (String item) {
              setState(() {
                selectedItem = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: Texts.tip,
                child: Row(
                  children: [
                    const Padding(
                      padding: Styles.rightText,
                      child: Icon(Icons.lightbulb_outline),
                    ),
                    Text(
                      Texts.tip,
                      style: Styles.defaultTextBoldStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
        title: Center(
          child: Text(
            Texts.appBarTitle,
            style: Styles.title,
          ),
        ),
      ),
      body: Home(
        action: selectedItem,
      ),
    );
  }
}
