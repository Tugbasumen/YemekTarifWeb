import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yemek1/data/models/category_model.dart';

class CategoryApi {
  final String _baseUrl =
      'https://www.themealdb.com/api/json/v1/1/categories.php';

  Future<List<CategoryModel>> getKategoriler() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final kategoriler = data['categories'] as List?;
      if (kategoriler == null) return [];
      return kategoriler.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Kategoriler alınamadı');
    }
  }
}
