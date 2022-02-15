import 'package:calculator_bmi/resuable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
const activeCardColor=Color(0xFF1D1E33);  // constant colour give to every Box Layout
const inactiveCardColor=Color(0xFF111380); // gesture color when on Tap function works

// Enum creation
enum GenderType{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;
  // 1==male and 2==female
  // update color method/function on tap on box to show different color
  void updateColour(GenderType gender){
    // male card pressed
    if(gender==GenderType.male){
      //check the male card color
      if(maleCardColour==inactiveCardColor){
        maleCardColour=activeCardColor; // switch on male card color
        femaleCardColour=inactiveCardColor;  // simultaneously switch off female card color
      }
      else{
        maleCardColour=inactiveCardColor; // reset state
      }
    }

    // female card pressed
    if(gender==GenderType.female){
      // check the female card color
      if(femaleCardColour==inactiveCardColor){
        femaleCardColour=activeCardColor; // switch on female card color
        maleCardColour=inactiveCardColor;// simultaneously switch off male card color
      }
      else{
        femaleCardColour=inactiveCardColor; //reset state
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF111328),// hexacode color is use here for appbar
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

              //MALE
              Expanded(child: GestureDetector(  // Gesture Detector change the color of boxes on tap
                onTap: (){
                  setState(() {     // calling update color method and set-state us use for functionality
                    updateColour(GenderType.male); // use enum here
                  });
                },
                child: ReusableCard(  // here reusablecard class working
                    colour:maleCardColour,
                  cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
                ),
              ),
              ),

              //FEMALE
              Expanded(child: GestureDetector(  // Gesture Detector change the color of boxes on tap
                onTap: (){
                  setState(() {     // calling update color method and set-state us use for functionality
                    updateColour(GenderType.female);  // use enum here
                  });
                },
                child:ReusableCard(
                  colour: femaleCardColour,
                cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
              ),),
              )],
          )),


          Expanded(child: ReusableCard(
            colour: activeCardColor,
            cardChild: IconContent(icon: FontAwesomeIcons.circle,label: 'Hey',),
          ),), // middle box in column widget containing column widget
          Expanded(child: Row(  // Second two box in column widget containing column widget
            children: <Widget>[
              Expanded(child: ReusableCard(
                colour:activeCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.addressBook,label: 'harsh',),
              ),),
              Expanded(child:ReusableCard(
                  colour: activeCardColor,
                cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'END',),
              ),),
            ],
          )),
          Container(  // bottom box for clicking
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(50.0),
            ),
            margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
            width: double.infinity,
            height: 70.0,
          )
        ],
      )
    );
  }
}



