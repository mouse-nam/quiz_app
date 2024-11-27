// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List questionBank = [
    "The U.S. declaration of Independence was adopted in 1776.",
    " *********** The U.S. declaration of Independence was adopted in 1776.",
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
      body: Container(
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
            Container(
              height: 120.0,
              child: Text(questionBank[0]),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
