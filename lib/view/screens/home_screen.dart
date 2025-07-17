import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yemek1/view/widgets/app_view.dart';
import 'package:yemek1/view/widgets/loading_widget.dart';
import 'package:yemek1/view/widgets/recipe_card.dart';
import 'package:yemek1/viewmodel/providers/recipe_viewmodel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ViewModel'den veriyi çekiyoruz
    final recipeState = ref.watch(recipeViewModelProvider);

    return Scaffold(
      body: AppView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LoadingView(
            state: recipeState,
            onData: (recipes) => GridView.builder(
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
            ),
          ),
        ),
      ),
    );
  }
}
