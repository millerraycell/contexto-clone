import 'package:contexto/components/word_item.dart';
import 'package:flutter/material.dart';

class WordList extends StatelessWidget {
  final List<WordItem> items;

  const WordList({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items,
    );
  }
}
