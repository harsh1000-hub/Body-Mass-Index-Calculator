import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour,required this.cardChild}); // custom color property
  final Color colour; // final because everytime new Reusable class is created so that's why new color everytime assign
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(   // one box design card class name as ReusableCard
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color:colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}