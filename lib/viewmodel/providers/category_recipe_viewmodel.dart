import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek1/data/datasources/themealdb_api.dart';
import 'package:yemek1/data/models/recipe_model.dart';
import 'package:yemek1/data/repositories/recipe_repository.dart';

final categoryRecipeProvider =
    StateNotifierProvider.family<
      CategoryRecipeViewModel,
      AsyncValue<List<RecipeModel>>,
      String
    >((ref, category) {
      final repository = RecipeRepository(ThemealdbApi());
      return CategoryRecipeViewModel(repository, category);
    });

//Belirli bir kategoriye ait tarif listesini getirir.
class CategoryRecipeViewModel
    extends StateNotifier<AsyncValue<List<RecipeModel>>> {
  final RecipeRepository repository;

  CategoryRecipeViewModel(this.repository, String category)
    : super(const AsyncValue.loading()) {
    fetchRecipesByCategory(category); // ekran açılınca veri çek
  }

  Future<void> fetchRecipesByCategory(String category) async {
    try {
      final recipes = await repository.getRecipesByCategory(category);
      state = AsyncValue.data(recipes); // UI'ye veri geldiğini bildir
    } catch (e, st) {
      state = AsyncValue.error(e, st); // Hata olduysa bildir
    }
  }
}
