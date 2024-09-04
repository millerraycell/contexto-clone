import 'package:contexto/components/faq.dart';
import 'package:contexto/components/how_to_play.dart';
import 'package:contexto/constants/styles.dart';
import 'package:flutter/material.dart';

class InitialGame extends StatelessWidget {
  const InitialGame({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: Styles.bottomPadding,
          child: HowToPlay(),
        ),
        Faq(),
      ],
    );
  }
}
