import 'package:contexto/constants/styles.dart';
import 'package:contexto/constants/texts.dart';
import 'package:flutter/material.dart';

class GameStats extends StatelessWidget {
  final int attempts = 0;
  const GameStats({required attempts, super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Styles.wrapSpacingElements,
      children: [
        Wrap(
          spacing: Styles.wrapSpacingLines,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            Text(
              Texts.game,
              style: Styles.gameStatsDescription,
            ),
            Text(
              _generateGameCount(),
              style: Styles.gameStats,
            ),
          ],
        ),
        Wrap(
          spacing: Styles.wrapSpacingLines,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            Text(
              Texts.attempts,
              style: Styles.gameStatsDescription,
            ),
            Text(
              attempts.toString(),
              style: Styles.gameStats,
            ),
          ],
        ),
      ],
    );
  }

  String _generateGameCount() {
    final today = DateTime.now();
    final startDate = DateTime(2022, 2, 23);
    final difference = today.difference(startDate).inDays;

    return '#$difference';
  }
}
