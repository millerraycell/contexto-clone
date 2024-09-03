import 'package:contexto/constants/styles.dart';
import 'package:contexto/constants/texts.dart';
import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: Styles.verticalPadding,
          child: Row(
            children: [
              const Padding(
                padding: Styles.rightText,
                child: Icon(Icons.help_center_outlined),
              ),
              Text(
                Texts.faq,
                style: Styles.subtitle,
              ),
            ],
          ),
        ),
        ExpansionTile(
          title: Text(
            Texts.faqQuestion1,
            style: Styles.gameStatsDescription,
          ),
          children: [
            Padding(
              padding: Styles.padding,
              child: Text(
                Texts.faqAnswer1,
                style: Styles.faqDescription,
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text(
            Texts.faqQuestion2,
            style: Styles.gameStatsDescription,
          ),
          children: [
            Padding(
              padding: Styles.padding,
              child: Text(
                Texts.faqAnswer2,
                style: Styles.faqDescription,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
