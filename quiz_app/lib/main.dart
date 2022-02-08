import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
QuizBrain quizBrain=QuizBrain(); // creating a object of QuizBrain
void main() => runApp(Quiz_App());  // main function

class Quiz_App extends StatelessWidget {  // stateless widget use for user interface of the app and inheritance work here
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 30.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.indigo.shade700,
          title: Center(child: Text('Quizzeler'),),
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {   // stateful widget to enable the core functioning of the app
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Widget>scoreKeeper=[];// List of type Widget declare to  keep track of scoreKeeper
  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer=quizBrain.getCorrectAnswer(); // call the getCorrectAnswer from quiz_brain.dart for true condition
    setState(() { // it give the functionality to update the questionNumber
      if (quizBrain.isFinished() == true) {  // if quiz is completed
        Alert(  // Alert pop-up
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        //reset the questionNumber,
        quizBrain.reset();   // app reset here

        //empty out the scoreKeeper.
        scoreKeeper = [];
      }
      //If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
        if (userPickedAnswer == correctAnswer) { // track the quiz progress
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
            size: 25.0,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
            size: 25.0,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // questions[questionNumber],  // this keep of question Number
                quizBrain.getQuestionText(),   // call the question material from quiz.brain class
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Card( // true flat button
          elevation: 15.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Expanded(
            child: Padding(
              padding:EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)
                ),
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
                onPressed: () {//The user picked true.
                  checkAnswer(true);  // Inheritance work and call checkAnswer method
                },
              ),
            ),
          ),
        ),

        Card( // false flat button
          elevation: 15.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          color: Colors.white,
          child: Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)
                ),
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkAnswer(false); // Inheritance work here and call checkAnswer method
                },
              ),
            ),
          ),
        ),
        // Build a score Keeper
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
