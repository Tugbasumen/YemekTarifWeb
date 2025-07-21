import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yemek1/data/models/recipe_model.dart';
import 'package:yemek1/view/widgets/loading_widget.dart';
import 'package:yemek1/view/widgets/recipe_card.dart';
import 'package:yemek1/view/widgets/recipe_grid_view.dart';
import 'package:yemek1/viewmodel/providers/category_recipe_viewmodel.dart';
import 'package:yemek1/view/widgets/app_view.dart';

class CategoryRecipeScreen extends ConsumerWidget {
  final String category;

  const CategoryRecipeScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeState = ref.watch(categoryRecipeProvider(category));

    return Scaffold(
      body: AppView(
        child: LoadingView<List<RecipeModel>>(
          state: recipeState,
          onData: (recipes) => RecipeGridView(
            recipes: recipes,
            onTap: (recipe) {
              context.go('/recipe_detail/${recipe.id}');
            },
          ),
        ),
      ),
    );
  }
}
