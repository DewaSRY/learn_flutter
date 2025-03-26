
import 'package:flutter/material.dart';

class MainWrapper extends StatelessWidget{
  const MainWrapper({required this.children, super.key});

  final Widget children;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purpleAccent, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: children,
        ),
      ),
    );
  }

}