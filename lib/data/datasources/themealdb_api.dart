import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yemek1/data/models/recipe_model.dart';

//ratgele yemek getirmek için kullanılan API
class ThemealdbApi {
  final _baseUrl = 'https://www.themealdb.com/api/json/v1/1/search.php?s=';

  Future<List<RecipeModel>> getYemekler() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final yemekler = data['meals'] as List?;
      if (yemekler == null) return [];
      return yemekler.map((json) => RecipeModel.fromJson(json)).toList();
    } else {
      throw Exception("Could not get recipes");
    }
  }

  // kategoriye göre yemk getirmek için kullanılan API
  Future<List<RecipeModel>> getRecipesByCategory(String category) async {
    final url =
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final yemekler = data['meals'] as List?;
      if (yemekler == null) return [];
      return yemekler.map((json) => RecipeModel.fromJson(json)).toList();
    } else {
      throw Exception('Unable to retrieve recipes by category');
    }
  }

  // yemek ID si ile  yemk getirmek için kullanılan API
  Future<List<RecipeModel>> getRecipeById(String id) async {
    final url = 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final yemekler = data['meals'] as List?;
      if (yemekler == null) return [];
      return yemekler.map((json) => RecipeModel.fromJson(json)).toList();
    } else {
      throw Exception('Could not get recipe detailsı');
    }
  }
}
