

import 'package:flutter/material.dart';

enum CategoryEnum {
  food, travel, leisure, work
}

final Map<CategoryEnum, IconData> categoryIconsMap ={
  CategoryEnum.food: Icons.lunch_dining,
  CategoryEnum.travel: Icons.flight_takeoff,
  CategoryEnum.leisure: Icons.movie,
  CategoryEnum.work: Icons.laptop
};

