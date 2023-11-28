import 'question.dart';
class QuizBrain{

  int _questionNumber = 0;
final List<Question> _questionBank = [ // _ uses to Make the quiz brain class privet
  Question(questionText: 'Is Sri Lanka is bueatiful', answers: true),
  Question(questionText: 'I am 23 yaers old', answers: true),
  Question(questionText: 'Parer\'s son is good', answers: false),
];

  void nextQuestion(){
    if(_questionNumber< _questionBank.length){
      _questionNumber++;
    }
  }

  void previousQestion(){
    if(_questionNumber>=0){
      _questionNumber--;
    }
  }

  bool isOver(){
    if(_questionNumber == _questionBank.length){
      _questionNumber =0;
      return true;
    }
    else{
      return false;
    }
  }

  int getLengthOfList(){
    return _questionBank.length;
  }

 String getQuestionText(){
   return _questionBank[_questionNumber].questionText;
 }

 bool getQuestionAnswer(){
   return _questionBank[_questionNumber].answers;
 }
}