
import 'package:fekraapp/examApp/model/question.dart';

class AppBrain{
  List<Question> _questions = [
    Question(questionText: "فازت الارجنتين بكأس العالم الاخير؟", questionImage: "images/image-1.png", questionAnswer: true),
    Question(questionText: "فاز ميسي بكأس العالم ؟", questionImage: "images/image-2.png", questionAnswer: true),
    Question(questionText: "هل رونالدو افضل من ميسي ؟", questionImage: "images/image-3.png", questionAnswer: false),
    Question(questionText: "هل رونالدو يلعب في ريال مدريد الان", questionImage: "images/image-4.png", questionAnswer: false),
  ];

  int _index = 0;

  void nextQuestion(){
    if (_index != _questions.length - 1) {
      _index ++;
    }
  }

  int getQuestionIndex(){
    return _index;
  }

  String getQuestionText(){
    return _questions[_index].questionText;
  }

  String getQuestionImage(){
    return _questions[_index].questionImage;
  }

  bool getQuestionAnswer(){
    return _questions[_index].questionAnswer;
  }

  int getQuestionLength(){
    return _questions.length;
  }

  void resetQuestions(){
    _index = 0;
  }

}


