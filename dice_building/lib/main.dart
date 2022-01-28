import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNUmber=1;
  int rightDiceNumber=1;
  void changeDiceFace() // Function
  {
    leftDiceNUmber=Random().nextInt(6)+1;
    rightDiceNumber=Random().nextInt(6)+1;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded( // Expanded class use to set the appropriate size of a image
            child: FlatButton(
              onPressed: () { // This onPressed is anonymous Function
                setState(() { // Set state give functionality to LeftDiceNumber
                  // leftDiceNUmber=Random().nextInt(6)+1;
                  // rightDiceNumber=Random().nextInt(6)+1;
                  changeDiceFace();
                  // Default range of random Number Generator is 0 to max
                  // print('LeftDiceNumber = $leftDiceNUmber');
                  // print('right=$rightDiceNumber');
                });
              },
              child: Image.asset('images/dice$leftDiceNUmber.png'), // $ sign is used to addressed the leftDiceNumber
            ),
          ),
          Expanded( // Expanded class use to set the appropriate size of a image
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    //rightDiceNumber=Random().nextInt(6)+1;
                    //leftDiceNUmber=Random().nextInt(6)+1;
                    changeDiceFace();
                    // we both left and right so one one button pressed both button will be in active state
                    // Random()/nextInt(6)+1 -> here (+1) is used because to verify the range b/w 1 to 6
                    // print('RightDiceNumber=$rightDiceNumber');
                    // print('left =$leftDiceNUmber');
                  });
            },
            child: Image.asset('images/dice$rightDiceNumber.png'))
          ),
        ],
      ),
    );
  }
}
