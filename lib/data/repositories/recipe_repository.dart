import 'package:yemek1/data/datasources/themealdb_api.dart';
import 'package:yemek1/data/models/recipe_model.dart';

//ViewModel'e veri sağlar
class RecipeRepository {
  final ThemealdbApi api;

  RecipeRepository(this.api);
  Future<List<RecipeModel>> getRandomRecipes() {
    return api
        .getYemekler(); 
  }
}
