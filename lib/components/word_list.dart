import 'package:contexto/components/word_item.dart';
import 'package:flutter/material.dart';

class WordList extends StatelessWidget {
  final List<WordItem> items;
  final String currentWord;

  const WordList({required this.items, required this.currentWord, super.key});

  @override
  Widget build(BuildContext context) {
    items.sort((word1, word2) => word1.distance.compareTo(word2.distance));

    return Column(
      children: items,
    );
  }
}
