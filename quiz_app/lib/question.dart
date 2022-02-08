class Question{
  late String questionText;   // late keyword use is to use the variable in later process
  late bool questionAnswer;

  Question({ required String q,required bool a}){ // constructor
    questionText=q;
    questionAnswer=a;
  }
}