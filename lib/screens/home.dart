import 'package:contexto/components/game_stats.dart';
import 'package:contexto/constants/styles.dart';
import 'package:contexto/screens/initial_game.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int attempts = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.padding,
      child: ListView(
        children: [
          Padding(
            padding: Styles.verticalPadding,
            child: GameStats(attempts: attempts),
          ),
          Offstage(
            offstage: attempts != 0,
            child: const InitialGame(),
          ),
        ],
      ),
    );
  }
}
