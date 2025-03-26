import 'package:flutter/material.dart';

class StyledText extends StatelessWidget{

  const StyledText(this.text, {super.key});

  final String text;

  @override
  Widget build(Object context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 28.0),
      ),
    );
  }
}

