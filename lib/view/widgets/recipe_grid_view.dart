import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yemek1/data/models/recipe_model.dart';
import 'package:yemek1/view/widgets/recipe_card.dart';

class RecipeGridView extends StatelessWidget {
  final List<RecipeModel> recipes;
  final Function(RecipeModel) onTap;
  const RecipeGridView({super.key, required this.recipes, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
        childAspectRatio: 0.8,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return RecipeCard(
          id: recipe.id,
          title: recipe.name,
          imageUrl: recipe.imageUrl,
          category: recipe.category,
          onTap: () {
            context.go('/recipe_detail/${recipe.id}');
          },
        );
      },
    );
  }
}
