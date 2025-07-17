import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/themealdb_api.dart';
import '../../data/repositories/recipe_repository.dart';
import '../../data/models/recipe_model.dart';

//Provider: UI tarafı buradan veriyi dinler
final recipeViewModelProvider =
    StateNotifierProvider<RecipeViewModel, AsyncValue<List<RecipeModel>>>((
      ref,
    ) {
      final api = ThemealdbApi();
      final repository = RecipeRepository(api);
      return RecipeViewModel(repository);
    });

// ViewModel sınıfı
class RecipeViewModel extends StateNotifier<AsyncValue<List<RecipeModel>>> {
  final RecipeRepository repository;

  RecipeViewModel(this.repository) : super(const AsyncValue.loading()) {
    fetchRecipes(); // Oluştuğunda veri çek
  }

  // API üzerinden veri çeken fonksiyon
  Future<void> fetchRecipes() async {
    try {
      final recipes = await repository.getRandomRecipes();
      state = AsyncValue.data(recipes); // Başarılıysa state güncellenir
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
