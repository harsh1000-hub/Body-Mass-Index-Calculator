import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BallPage(),
    )
  );
}
class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Center(
            child: Text('Ask Me Anything'),),
        backgroundColor: Colors.black,
      ),
      body: Ball(),
    );
  }
}
class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  @override
  int ballNumber=1;
  Widget build(BuildContext context) {
    return Center(
        child: FlatButton(
            onPressed: () {
              setState(() { // give functionality to ballNumber tapping process
                ballNumber=Random().nextInt(5)+1;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/ball$ballNumber.png'),
            )),
    );
  }
}
