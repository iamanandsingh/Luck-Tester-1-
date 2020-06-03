import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Luck Tester",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          backgroundColor: Colors.green[900],
        ),
        body: Dice(),
      ),
    );
  }
}

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int num = 1;

  void roller() {
    setState(() {
      this.num = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [

            Expanded(
              flex: 2,
              child: FlatButton(
                  onPressed: () {
                    roller();
                  },
                  child: Image.asset('images/dice$num.png',
                      gaplessPlayback: true)),
            ),
            Expanded(
              flex:1,
              child: num == 6
                  ? Text(
                      "Won 1st Round",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    )
                  : Text("Better Luck Next Time",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        backgroundColor: Colors.red,

                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
