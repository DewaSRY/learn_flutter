import 'package:flutter/material.dart';
import 'package:max_learn/meals_app/meals_model.dart';
import 'package:transparent_image/transparent_image.dart';
import 'meals_item_trait_widget.dart';

class MealsItemWidget extends StatelessWidget {
  const MealsItemWidget({required this.onTap, required this.meals, super.key});

  final MealsModel meals;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meals.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                color: Color.fromARGB(169, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      meals.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealsItemTraitWidget(
                          label: " ${meals.duration} min",
                          icon: Icons.schedule,
                        ),
                        MealsItemTraitWidget(
                          label: " ${getTitleCase(meals.complexity.name)} ",
                          icon: Icons.work,
                        ),
                        MealsItemTraitWidget(
                          label: " ${getTitleCase(meals.affordability.name)} ",
                          icon: Icons.attach_money,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
