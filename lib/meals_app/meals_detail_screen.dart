import 'package:flutter/material.dart';
import 'package:max_learn/meals_app/meals_model.dart';

class MealsDetailScreen extends StatelessWidget {
  const MealsDetailScreen({required this.mealsModel, super.key});

  final MealsModel mealsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mealsModel.title)),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                mealsModel.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              Text(
                "Ingredients :",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 12),
              for (var i in mealsModel.ingredients)
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Text(
                    i,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),

              Text(
                "Steps :",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 12),
              for (var i in mealsModel.steps)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: Text(
                    i,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
