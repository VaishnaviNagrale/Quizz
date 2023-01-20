import 'package:quizzler/questions.dart';

class QuestionBrain {
  int i=0;
  final List<Question> _questionbank = [
       Question('Delhi is capital of India',true),
       Question('Maharashtra is a big state',true),
       Question('Virat Kohali is a tennis player',false),
       Question('There are 8 colors in an rainbow', false),
       Question('Earth is a best planet in universe',true),
       Question('Water is made up of Hydrogen and Nitrogen molecules',false),
    ];
   String getQuestiontext(){
     return _questionbank[i].questions;
   }
   bool getQuestionAns(){
     return _questionbank[i].qAns;
   }
   void getNextQuestion() {
     if (i < _questionbank.length - 1) {
       i++;
     }
   }
  void rest() {
    i = 0;
  }
     bool isFinished(){
       if(i>=_questionbank.length -1){
         print('quiz has run out');
         return true;
       }
       return false;
     }
}