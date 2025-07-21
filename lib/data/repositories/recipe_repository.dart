import 'package:yemek1/data/datasources/themealdb_api.dart';
import 'package:yemek1/data/models/recipe_model.dart';

//ViewModel'e veri sağlar
class RecipeRepository {
  final ThemealdbApi api;
  //Rastgele yemek
  RecipeRepository(this.api);
  Future<List<RecipeModel>> getRandomRecipes() {
    return api.getYemekler();
  }

  //kategoriye göre yemek
  Future<List<RecipeModel>> getRecipesByCategory(String category) {
    return api.getRecipesByCategory(category);
  }

  // id ye göre yemek
  Future<List<RecipeModel>> getRecipeById(String id) {
    return api.getRecipeById(id);
  }
}
