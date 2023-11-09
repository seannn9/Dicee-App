import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
      MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.blueAccent,
            appBar: AppBar(
              title: const Text('Dicee'),
              backgroundColor: Colors.blue[900],
            ),
            body: const DicePage(),
          )
      )
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1, right = 1, sum = 0, leftScore = 0, rightScore = 0;
  @override
  Widget build(BuildContext context) {
    sum = left + right;
    score();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  child: Text("Score: $leftScore", style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25.0,
                  ),)
              )),
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                child: Text("Score: $rightScore", style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25.0
                )),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        changeValue();
                      });
                    },
                    child: Image.asset('images/dice$left.png'),
                  )
              )),
              Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        changeValue();
                      });
                    }, child: Image.asset('images/dice$right.png'),
                  )
              )),
            ],
          ),
          Text("The total roll is $sum",
              style: const TextStyle(
                fontSize: 25.0,
                fontFamily: "Poppins",
              )),
          Text(getWinner(),
              style: const TextStyle(
                fontSize: 25.0,
                fontFamily: "Poppins",
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
            child: FilledButton(onPressed: () {
              setState(() {
                left = 1;
                right = 1;
                leftScore = 0;
                rightScore = 0;
              });
            },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ), child: const Text(
                  "Reset Score"
              ),
            ),
          )
        ],
      ),
    );
  }

  void changeValue() {
    left = 1 + Random().nextInt(6);
    right = 1 + Random().nextInt(6);
  }

  String getWinner() {
    if (left > right) {
      return "Left dice rolls higher";
    } else if (right > left) {
      return "Right dice rolls higher";
    } else {
      return "Dice rolls are equal";
    }
  }

  void score() {
    if (left > right) {
      leftScore++;
    } else if (right > left) {
      rightScore++;
    }
  }
}