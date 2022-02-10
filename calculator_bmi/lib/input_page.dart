import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Color(0xFF1D1E33),// hexacode color is use here for appbar
        title: Center(
          child: Text(
            'B.M.I Calculator',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23.0),
          ),
        ),
      ),
      body:Column(    // Column widget to contain multiple children layout
        children: <Widget>[
          Expanded(child: Row(  // First two box in column widget containing column widget
            children: <Widget>[
              Expanded(child: ReusableCard(colour: Color(0xFF1D1E33),),),  // here Resusablecard class working
              Expanded(child:ReusableCard(colour: Color(0xFF1D1E33),),),
            ],
          )),
          Expanded(child: ReusableCard(colour: Color(0xFF1D1E33),),), // middle box in column widget containing column widget
          Expanded(child: Row(  // Second two box in column widget containing column widget
            children: <Widget>[
              Expanded(child: ReusableCard(colour: Color(0xFF1D1E33),),),
              Expanded(child:ReusableCard(colour: Color(0xFF1D1E33),),),
            ],
          )),
        ],
      )
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour}); // custom color property
  Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(   // one box design card class name as ReusableCard
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color:colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}