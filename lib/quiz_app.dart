// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name(
        "The U.S. declaration of Independence was adopted in 1776.", true),
    Question.name("Persuit of happiness", true),
    Question.name("wolf of the wall street", true),
    Question.name("Lucky Bhaskar", true),
    Question.name("spy x family", false),
    Question.name("To the eternity", true),
    Question.name("Substance", false),
    Question.name("Smile", false),
    Question.name("Kuruup", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "True Citizens",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "images/flag.png",
                  width: 250,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      width: 2.0,
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid,
                    ),
                  ),
                  height: 120.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        questionBank[_currentQuestionIndex].questionText,
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => _checkAnswer(true, context),
                    // color: Colors.blueGrey.shade900,
                    child: Text(
                      "True",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _checkAnswer(false, context),
                    child: Text(
                      "False",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _nextQuestion(),
                    child: Icon(Icons.arrow_forward, color: Colors.black),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackbar = SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(microseconds: 2000),
        content: Text("correct"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      debugPrint("Correct");
    } else {
      final snackbar = SnackBar(
        backgroundColor: Colors.red,
        duration: Duration(microseconds: 2000),
        content: Text("Incorrect"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      debugPrint("Incorrect");
    }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }
}
