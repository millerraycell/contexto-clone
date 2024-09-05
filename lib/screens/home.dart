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
  WordItem currentItem = const WordItem(
    distance: 0,
    word: '',
  );

  final WordService wordService = WordService();

  @override
  void didUpdateWidget(covariant Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      if (widget.action == Texts.tip) {
        getTip();
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
                hintText: Texts.typeWord,
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
            offstage: isRepeatedWord || currentItem.distance == 0,
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
                    Texts.alreadyUsedPart1,
                    style: Styles.defaultTextStyle,
                  ),
                  Text(
                    ' $currentWord ',
                    style: Styles.defaultTextBoldStyle,
                  ),
                  Text(
                    Texts.alreadyUsedPart2,
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
              currentWord: currentWord,
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
      setState(() {
        currentDistance = -2;
        currentWord = wordTyped;
        isRepeatedWord = true;
      });
    } else {
      final distance = await wordService.getDistance(wordTyped);
      setState(() {
        currentWord = wordTyped;
        currentDistance = distance.distance;
        if (wordService.isValid(distance.distance)) {
          addWords(distance.distance, distance.word);
        }
        attempts++;
      });
    }
    inputController.clear();
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

  void getTip() async {
    int tipValue;

    if (wordList.isNotEmpty) {
      tipValue = wordList[0].distance < tipsDistance
          ? wordList[0].distance ~/ 2
          : tipsDistance;
    } else {
      tipValue = tipsDistance;
    }

    final tip = await wordService.getTip(tipValue);
    setState(() {
      addWords(tip.distance, tip.word);
      tipsDistance = (tipValue ~/ 2);
      tips++;
    });
  }

  void addWords(int distance, String word) {
    currentItem = WordItem(distance: distance, word: word);
    wordList.add(currentItem);
  }
}
