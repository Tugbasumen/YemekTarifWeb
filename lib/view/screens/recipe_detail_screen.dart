import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek1/view/widgets/app_view.dart';
import 'package:yemek1/view/widgets/loading_widget.dart';
import 'package:yemek1/view/widgets/recipe_detail_card.dart';
import 'package:yemek1/viewmodel/providers/recipe_viewmodel.dart';

class RecipeDetailScreen extends ConsumerWidget {
  final String recipeId;

  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeState = ref.watch(recipeViewModelProvider);

    return AppView(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/arkaplan2.jpg',
            ), // Arka plan resminizin yolu
            fit: BoxFit.fill, // Resmin boyutlandırma şekli
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LoadingView(
            state: recipeState,
            onData: (recipes) {
              final recipe = recipes.firstWhere(
                (r) => r.id == recipeId,
                orElse: () => throw Exception("Yemek bulunamadı"),
              );

              return RecipeDetailCard(
                title: recipe.name,
                imageUrl: recipe.imageUrl,
                category: recipe.category,
                ingredients: recipe.ingredients,
                instructions: recipe.instructions,
                youtubeUrl: recipe.youtubeUrl,
              );
            },
          ),
        ),
      ),
    );
  }
}
