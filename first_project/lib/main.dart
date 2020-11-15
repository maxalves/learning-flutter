import 'package:flutter/material.dart';
import 'package:flutter_learning/result.dart';

import './quiz.dart';

void main() => runApp(MyCoolApp());

class MyCoolApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyCoolApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 0},
        {'text': 'Green', 'score': 0},
        {'text': 'Pink', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Lion', 'score': 0},
        {'text': 'Duck', 'score': 0},
        {'text': 'Isabelle', 'score': 0},
      ],
    },
    {
      'questionText': 'Who is your favorite instructor?',
      'answers': [
        {'text': 'Isa', 'score': 10},
        {'text': 'Max', 'score': 0},
        {'text': 'Marcia', 'score': 0},
        {'text': 'Alan', 'score': 0},
      ],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Best game ever'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
