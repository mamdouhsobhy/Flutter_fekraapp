import 'package:fekraapp/examApp/model/app_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main(){
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Info",style: TextStyle(color: Colors.white),),
      ),
      body: QuestionApp(),
    ),
  ));
}

class QuestionApp extends StatefulWidget {
  const QuestionApp({super.key});

  @override
  State<QuestionApp> createState() => _QuestionAppState();
}

class _QuestionAppState extends State<QuestionApp> {

  AppBrain brain = AppBrain();

  List<Icon> answers = [];

  void answer(bool answer){
    setState(() {
      if(answer == brain.getQuestionAnswer()){
         answers.add(Icon(Icons.thumb_up,color: Colors.green,));
      }else{
        answers.add(Icon(Icons.thumb_down,color: Colors.red,));
      }

      if (brain.getQuestionIndex() != brain.getQuestionLength() - 1) {
        brain.nextQuestion();
      }else{
        brain.resetQuestions();
        answers.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Column(children: [
              Row(
               children: answers,
              ),
              SizedBox(height: 20,),
              Image(width: double.infinity,height: 200,image: AssetImage(brain.getQuestionImage()),fit: BoxFit.fill,),
              SizedBox(height: 30,),
              Text(brain.getQuestionText())
            ]
            ),
          ),
         Expanded(
           flex: 1,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               TextButton(onPressed: (){
                 answer(true);
               },style: TextButton.styleFrom(
                 backgroundColor: Colors.indigo,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
               ), child: Text("صح",style: TextStyle(color: Colors.white,fontSize: 20))),
               SizedBox(height: 15,),
               TextButton(onPressed: (){
                 answer(false);
               },style: TextButton.styleFrom(
                   backgroundColor: Colors.red,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
               ), child: Text("خطأ",style: TextStyle(color: Colors.white,fontSize: 20)))
             ],
           ),
         )

        ],
      ),
    );
  }
}
