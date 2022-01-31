import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) // function with arguments
  {
    final player=AudioCache(); // audiocache() function comes from audioplayer packages
    player.play('note$soundNumber.wav'); // string interpolation
  }

  // Expanded buildkey function
  Expanded buildKey({Color color,int soundNumber}){   // expanded buildkey reduce the code redundancy
    // return Expanded type with parameter color,soundNumber
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(soundNumber); // function calling with string interpolation
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(child: Text('Pinao-Phone'),),
          backgroundColor: Colors.redAccent,
        ),
        body: SafeArea(
          child: Column( // column widget wih multiple layouts
            crossAxisAlignment: CrossAxisAlignment.stretch,// stretch out the flatbutton
            children: <Widget>[
              // Expanded function in Line 35 -41
              buildKey(color: Colors.white,soundNumber: 1),
            buildKey(color: Colors.black,soundNumber: 2),
            buildKey(color: Colors.white,soundNumber: 3),
            buildKey(color: Colors.black,soundNumber: 4),
            buildKey(color: Colors.white,soundNumber: 5),
            buildKey(color: Colors.black,soundNumber: 6),
            buildKey(color: Colors.white,soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
