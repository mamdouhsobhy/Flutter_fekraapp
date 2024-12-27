import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ReviewExamApp());
}

class ReviewExamApp extends StatelessWidget {
  const ReviewExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          backgroundColor: Colors.indigo[400],
          title: Text(
            "تطابق صوره",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ExamContent(),
      ),
    );
  }
}

class ExamContent extends StatefulWidget {
  const ExamContent({super.key});

  @override
  State<ExamContent> createState() => _ExamContentState();
}

class _ExamContentState extends State<ExamContent> {
  var leftIndex = 1;
  var rightIndex = 2;


  void changeImage(){
    leftIndex = Random().nextInt(9) + 1;
    rightIndex = Random().nextInt(9) + 1;
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftIndex!=rightIndex? "try again?":"mabroook",
          style: TextStyle(color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(child: TextButton(onPressed: (){
              setState(() {
                changeImage();
              });
            },child: Image(width: 150,height: 150,image: AssetImage("images/image-$leftIndex.png")))),
            Expanded(child: TextButton(onPressed: (){
              setState(() {
                changeImage();
              });
            },child: Image(width: 150,height: 150,image: AssetImage("images/image-$rightIndex.png")))),
          ],
        )
      ],
    );
  }
}
