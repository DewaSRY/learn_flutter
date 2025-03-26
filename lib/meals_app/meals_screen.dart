import 'package:flutter/material.dart';
import 'package:max_learn/meals_app/meals_detail_screen.dart';
import 'meals_model.dart';
import 'meals_item_widget.dart';
import 'meals_detail_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({required this.title, required this.meals, super.key});

  final String title;
  final List<MealsModel> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (meals.isEmpty) {
      return Padding(padding: EdgeInsets.all(20), child: Center(
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            Text("Please Make your meals first",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge
            ),
            const SizedBox(height: 16),
            Text(
              "Try Selecting a different categories  ",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),);
    }
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, idx) {
        MealsModel mealsModel = meals[idx];
        return MealsItemWidget(meals: mealsModel,onTap: ()=>selectedMeals(context, mealsModel));
      },
    );
  }

  void selectedMeals(BuildContext context, MealsModel mealsModel){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx)=> MealsDetailScreen(mealsModel: mealsModel,))
      );
  }
}
