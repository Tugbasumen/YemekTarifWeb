import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek1/data/models/recipe_model.dart';
import 'package:yemek1/view/widgets/app_view.dart';
import 'package:yemek1/view/widgets/loading_widget.dart';
import 'package:yemek1/view/widgets/recipe_detail_card.dart';
import 'package:yemek1/viewmodel/providers/recipe_detail_viewmodel.dart';

class RecipeDetailScreen extends ConsumerWidget {
  final String recipeId;

  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeState = ref.watch(recipeDetailProvider(recipeId));
    return AppView(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/arkaplan2.jpg'),
            fit: BoxFit.fill, // Resmin boyutlandırma
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LoadingView<RecipeModel>(
            state: recipeState,
            onData: (recipe) => RecipeDetailCard(
              title: recipe.name,
              imageUrl: recipe.imageUrl,
              category: recipe.category,
              ingredients: recipe.ingredients,
              instructions: recipe.instructions,
              youtubeUrl: recipe.youtubeUrl,
            ),
          ),
        ),
      ),
    );
  }
}
