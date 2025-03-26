import 'package:flutter/material.dart';

class MealsItemTraitWidget extends StatelessWidget {
  const MealsItemTraitWidget({
    required this.label,
    required this.icon,
    super.key,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Row(
        children: [
          Icon(icon, size: 17, color: Colors.white),
          SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}
