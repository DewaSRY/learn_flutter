import 'package:flutter/material.dart';
import 'categories_model.dart';

class CategoriesGridItemWidget extends StatelessWidget {
  const CategoriesGridItemWidget({
    required this.onTap,
    required this.categoriesModel,
    super.key,
  });

  final CategoriesModel categoriesModel;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              categoriesModel.color.withAlpha(155),
              categoriesModel.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          categoriesModel.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
