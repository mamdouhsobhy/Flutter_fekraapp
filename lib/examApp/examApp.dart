import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:fekraapp/examApp/model/app_brain.dart';
import 'package:fekraapp/examApp/model/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[500],
          title: Text(
            "اختبار",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        )),
      ),
    );
  }
}


class ExamPage extends StatefulWidget {
  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {

  List<Icon> answerResult = [];

  AppBrain appBrain = AppBrain();

  int correct= 0;

  Icon getIconResult(Color color, IconData icon) {
    return Icon(
      icon,
      color: color,
    );
  }

  void checkAnswer(bool answer){
    if (answerResult.length != appBrain.getQuestionLength()) {
      if (appBrain.getQuestionAnswer() == answer) {
        correct++;
        answerResult
            .add(getIconResult(Colors.green, Icons.thumb_up));
      } else {
        answerResult.add(getIconResult(
            Colors.redAccent, Icons.thumb_down));
      }
    }
    if (appBrain.getQuestionIndex() != appBrain.getQuestionLength() - 1) {
      appBrain.nextQuestion();
    }else{
      Alert(
        context: context,
        title: "Exam",
        desc: "you answered $correct correct from ${appBrain.getQuestionLength()} questions",
        buttons: [
          DialogButton(
            child: Text(
              "Try again",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            onPressed: () => {
              Navigator.pop(context)
            },
            width: 120,
          )
        ],
      ).show();
      appBrain.resetQuestions();
      answerResult.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
            flex: 7,
            child: Column(
              children: [
                Image.asset(appBrain.getQuestionImage()),
                SizedBox(
                  height: 20,
                ),
                Text(appBrain.getQuestionText())
              ],
            )),
        Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      checkAnswer(true);
                    });
                  },
                  child: Text(
                    "صح",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      checkAnswer(false);
                    });
                  },
                  child: Text(
                    "خطأ",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero)),
                )
              ],
            ))
      ],
    );
  }
}
