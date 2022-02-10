import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith( // theme widget is use here to customize the theme of an app
          scaffoldBackgroundColor: Colors.white,  // background color
      ),
      home: InputPage(),
    );
  }
}