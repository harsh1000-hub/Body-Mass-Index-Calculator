import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const labelTextStyle=TextStyle(fontSize: 18.0,color: Colors.white);

class IconContent extends StatelessWidget {   // custom color property
  IconContent({required this.icon,required this.label});
  final IconData icon; // custom icon
  final String label;   // custom male and female and etc name
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,  // custom icon here
          size: 60.0,
        ),
        SizedBox(
          height: 18.0,
        ),
        Text(
          label, // custom icon here
          style: labelTextStyle,
        )
      ],
    );
  }
}