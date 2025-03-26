import 'package:flutter/material.dart';
import 'styled_text.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});


  @override
  State<StatefulWidget> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  final randomizer = Random();

  var currentDiceRole = 1;

  void rollDice() {
    setState(() {
      currentDiceRole = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    currentDiceRole = randomizer.nextInt(6) + 1;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("asset/images/dice-$currentDiceRole.png", width: 200),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(top: 4.0),
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 28),
          ),
          child: StyledText("halllo this"),
        ),
      ],
    );
  }
}
