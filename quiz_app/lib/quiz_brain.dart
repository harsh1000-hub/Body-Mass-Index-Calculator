import 'question.dart';  // inherit the questionText and QuestionAnswer


class QuizBrain{
  int _questionNumber=0;   // to track the questionNumber and questionNumber is private so no one change the questionNumber List
  // underscore(_) means private any property in dart and encapuslation works
  List<Question> _QuestionBank=[
    Question(q:'Some cats are actually allergic to humans', a: true),
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(q: 'Approximately one quarter of human bones are in the feet.', a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    Question(q: 'It is illegal to pee in the Ocean in Portugal.',a: true),
    Question(
        q: 'No piece of square dry paper can be folded in half more than 7 times.',
        a: false),
    Question(
       q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        a: true),
    Question(
        q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: false),
    Question(
        q: 'The total surface area of two human lungs is approximately 70 square metres.',
        a: true),
    Question(q: 'Google was originally called \"Backrub\".', a: true),
    Question(
        q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: true),
    Question(
        q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a: true),
  ];

  void nextQuestion(){
    if(_questionNumber<_QuestionBank.length-1){  // length-1 because to protect the app from crash problem
      _questionNumber++;
    }
    print(_questionNumber);
    print(_QuestionBank.length);
  }
  String getQuestionText(){    // getter function to get the data from private QuestionBank
    return _QuestionBank[_questionNumber].questionText;
  }
  bool getCorrectAnswer(){     // getter function to get true or false from the private QuestionBank
    return _QuestionBank[_questionNumber].questionAnswer;
  }
  bool isFinished() {
    if (_questionNumber >= _QuestionBank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }
  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }
}