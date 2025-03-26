import 'package:flutter/material.dart';
import 'package:max_learn/meals_app/meals_dummy_data.dart';
import 'package:max_learn/meals_app/meals_model.dart';
import 'package:max_learn/meals_app/meals_screen.dart';
import 'categories_grid_item_widget.dart';
import 'categories_model.dart';
import 'categories_dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<CategoriesModel> categoriesList = categoryDummyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick your category")),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        itemCount: categoriesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (ctx, idx) {
          final category =  categoriesList[idx];
          return CategoriesGridItemWidget(
            categoriesModel:category,
            onTap: ()=> selectCategory(ctx, category),
          );
        },
      ),
    );
  }

  void selectCategory(BuildContext context, CategoriesModel category){
    List<MealsModel> meals = dummyMealsModelsData.where(
        (v)=> v.categories.contains(category.id)
    ).toList();

    Navigator.of(context)
        .push(
      MaterialPageRoute(builder: (ctx)=> MealsScreen(title: category.title, meals: meals))
    );
  }
}
