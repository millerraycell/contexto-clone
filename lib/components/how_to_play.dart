import 'package:contexto/constants/colors.dart';
import 'package:contexto/constants/styles.dart';
import 'package:contexto/constants/texts.dart';
import 'package:flutter/material.dart';

class HowToPlay extends StatelessWidget {
  const HowToPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Styles.padding,
      decoration: const BoxDecoration(
        color: ContextoColors.howToPlayColor,
        borderRadius: Styles.borderRadius,
      ),
      child: Column(
        children: [
          Padding(
            padding: Styles.verticalPadding,
            child: Row(
              children: [
                const Padding(
                  padding: Styles.rightText,
                  child: Icon(Icons.help_outline_rounded),
                ),
                Text(
                  Texts.howToPlay,
                  style: Styles.title,
                ),
              ],
            ),
          ),
          Padding(
            padding: Styles.verticalPadding,
            child: Text(
              Texts.howToPlayText1,
              style: Styles.howToPlayText,
            ),
          ),
          Padding(
            padding: Styles.verticalPadding,
            child: Text(
              Texts.howToPlayText2,
              style: Styles.howToPlayText,
            ),
          ),
          Padding(
            padding: Styles.verticalPadding,
            child: Text(
              Texts.howToPlayText3,
              style: Styles.howToPlayText,
            ),
          ),
          Padding(
            padding: Styles.verticalPadding,
            child: Text(
              Texts.howToPlayText4,
              style: Styles.howToPlayText,
            ),
          ),
        ],
      ),
    );
  }
}
