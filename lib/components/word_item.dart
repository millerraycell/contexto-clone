import 'package:contexto/constants/colors.dart';
import 'package:contexto/constants/dimensions.dart';
import 'package:contexto/constants/styles.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class WordItem extends StatelessWidget {
  final int distance;
  final String word;

  const WordItem(this.distance, this.word, {super.key});

  Color getColor() {
    if (distance.toDouble() < Dimensions.nearDistanceRef) {
      return ContextoColors.nearColor;
    }
    if (distance.toDouble() > Dimensions.farDistancRef) {
      return ContextoColors.farColor;
    }

    return ContextoColors.mediumColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 55,
      decoration: const BoxDecoration(
        color: ContextoColors.tileBackground,
        borderRadius: Styles.borderRadius,
      ),
      child: Stack(
        children: [
          Container(
            width: getBarWidth(distance, context),
            decoration: BoxDecoration(
              color: getColor(),
              borderRadius: Styles.borderRadius,
            ),
          ),
          Padding(
            padding: Styles.padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  word,
                  style: Styles.defaultTextBoldStyle,
                ),
                Text(
                  (distance + 1).toString(),
                  style: Styles.defaultTextBoldStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  double getBarWidth(int distance, BuildContext ctx) {
    // width available
    final width = MediaQuery.of(ctx).size.width - 32.0; // 32

    const total = 111155;
    const lambda = 0.5;
    const startX = 0.0;
    const endX = 100.0;
    final startY = pdf(startX, lambda);
    final endY = pdf(endX, lambda);
    final x = distance / total * (endX - startX);
    final result = (pdf(x, lambda) - endY) / (startY - endY) * 100;
    return (result / 100) * width;
  }

  double pdf(double x, double lambda) {
    return lambda * exp((-lambda) * x);
  }
}
