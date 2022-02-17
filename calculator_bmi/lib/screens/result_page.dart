
import 'package:calculator_bmi/contants.dart';
import 'package:calculator_bmi/components/resuable_card.dart';
import 'package:flutter/material.dart';
class ResultsPage extends StatelessWidget {

  // this contructor will deliver all the calculated value
  ResultsPage({required this.bmiResult,required this.resultText,required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFF111328),
        title: Text('B.M.I Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,  // stretch out the card widget resuable card text box
        children: [
          Expanded(
            child: Container(
              child: Center(child: Text('Your Result',style: ktitleTextStyle,)),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                  colour:Color(0xFF1D1E33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(), // use from calculator brain class
                      style: kresultTextStyle,
                    ),
                    Text(
                      bmiResult, // use from calculator brain class
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation, // use from calculator brain class
                      style: kbodyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),

          // Second screen where result shows and re-calculate option will be there
          GestureDetector(
            onTap: (){
             Navigator.pop(context);
            },
            child: Container(  // bottom box for clicking
              child: Card(
                color: Colors.pinkAccent,
                child: Center(
                  child: Text(
                    'Re-Calculate',
                    style:klargestButtonTextStyle,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
              height:70.0,
            ),
          ),
        ],
      ),
    );
  }
}
