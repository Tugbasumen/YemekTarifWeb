import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek1/data/datasources/themealdb_api.dart';
import 'package:yemek1/data/models/recipe_model.dart';
import 'package:yemek1/data/repositories/recipe_repository.dart';

final recipeDetailProvider =
    StateNotifierProvider.family<
      RecipeDetailViewModel,
      AsyncValue<RecipeModel>,
      String
    >((ref, id) {
      final repository = RecipeRepository(ThemealdbApi());
      return RecipeDetailViewModel(repository, id);
    });

class RecipeDetailViewModel extends StateNotifier<AsyncValue<RecipeModel>> {
  final RecipeRepository repository;

  RecipeDetailViewModel(this.repository, String id)
    : super(const AsyncValue.loading()) {
    fetchRecipeById(id);
  }

  Future<void> fetchRecipeById(String id) async {
    try {
      final response = await repository.getRecipeById(id);
      if (response.isEmpty) {
        state = AsyncValue.error("No recipe found!", StackTrace.empty);
      } else {
        state = AsyncValue.data(response.first);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
