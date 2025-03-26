import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'categories_screen.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
      seedColor: Color.fromARGB(255, 30, 30, 30)
  ),
  textTheme: GoogleFonts.latoTextTheme().apply(
    bodyColor: Color.fromARGB(255, 221, 216, 216),
    displayColor: Colors.white,
  ),
);


class MealsApp extends StatelessWidget{
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: CategoriesScreen(),
    );
  }
}