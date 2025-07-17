import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yemek1/data/models/recipe_model.dart';

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
      throw Exception('Yemek tarifleri alınamadı');
    }
  }
}
