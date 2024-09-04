import 'package:contexto/components/game_stats.dart';
import 'package:contexto/components/word_item.dart';
import 'package:contexto/components/word_list.dart';
import 'package:contexto/constants/styles.dart';
import 'package:contexto/constants/texts.dart';
import 'package:contexto/screens/initial_game.dart';
import 'package:contexto/services/word_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String action;

  const Home({required this.action, super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController inputController = TextEditingController();

  int attempts = 0;
  int tips = 0;
  int tipsDistance = 300;
  String currentWord = '';
  int currentDistance = 0;
  bool isRepeatedWord = false;

  List<WordItem> wordList = [];
  WordItem currentItem = WordItem(0, '');

  final WordService wordService = WordService();

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      if (widget.action == Texts.tip) {
        tips++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.padding,
      child: ListView(
        children: [
          Padding(
            padding: Styles.bottomPadding,
            child: GameStats(
              attempts: attempts,
              tips: tips,
            ),
          ),
          Padding(
            padding: Styles.bottomPadding,
            child: TextField(
              controller: inputController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: 'Digite uma palavra',
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              onSubmitted: computeWordEntry,
            ),
          ),
          Offstage(
            offstage: isRepeatedWord || currentWord.isEmpty,
            child: Padding(
              padding: Styles.verticalPadding,
              child: currentItem,
            ),
          ),
          Offstage(
            offstage: !isRepeatedWord,
            child: Padding(
              padding: Styles.verticalPadding,
              child: Row(
                children: [
                  Text(
                    'A palavra',
                    style: Styles.defaultTextStyle,
                  ),
                  Text(
                    ' $currentWord ',
                    style: Styles.defaultTextBoldStyle,
                  ),
                  Text(
                    'já foi.',
                    style: Styles.defaultTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Offstage(
            offstage: attempts != 0 || tips != 0,
            child: const InitialGame(),
          ),
          Offstage(
            offstage: !(attempts != 0 || tips != 0),
            child: WordList(
              items: wordList,
            ),
          ),
        ],
      ),
    );
  }

  void computeWordEntry(String wordTyped) async {
    isRepeatedWord = false;
    if (wordAlreadyExists(wordTyped)) {
      currentDistance = -2;
      currentWord = wordTyped;
      setState(() {
        isRepeatedWord = true;
      });
      inputController.clear();
    } else {
      final distance = await wordService.getDistance(wordTyped);
      setState(() {
        currentWord = wordTyped;
        currentDistance = distance.distance;
        if (wordService.isValid(currentDistance)) {
          wordList.add(WordItem(distance.distance, wordTyped));
          currentItem = WordItem(distance.distance, wordTyped);
          wordList
              .sort((word1, word2) => word1.distance.compareTo(word2.distance));
        }
        attempts++;
        inputController.clear();
      });
    }
  }

  bool wordAlreadyExists(String word) {
    bool alreadyExists = false;
    for (final item in wordList) {
      if (item.word.contains(word)) {
        alreadyExists = true;
      }
    }
    return alreadyExists;
  }
}
