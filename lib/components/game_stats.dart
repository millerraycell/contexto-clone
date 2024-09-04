import 'package:contexto/constants/styles.dart';
import 'package:contexto/constants/texts.dart';
import 'package:contexto/services/word_service.dart';
import 'package:flutter/material.dart';

class GameStats extends StatelessWidget {
  final int attempts;
  final int tips;

  final WordService wordService = WordService();

  GameStats({required this.attempts, required this.tips, super.key});

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
              style: Styles.defaultTextBoldStyle,
            ),
            Text(
              '#${wordService.getGameId()}',
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
              style: Styles.defaultTextBoldStyle,
            ),
            Text(
              attempts.toString(),
              style: Styles.gameStats,
            ),
          ],
        ),
        Offstage(
          offstage: tips == 0,
          child: Wrap(
            spacing: Styles.wrapSpacingLines,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              Text(
                Texts.tips,
                style: Styles.defaultTextBoldStyle,
              ),
              Text(
                tips.toString(),
                style: Styles.gameStats,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
