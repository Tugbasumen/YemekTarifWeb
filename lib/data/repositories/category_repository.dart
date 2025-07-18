import 'package:yemek1/data/datasources/category_api.dart';
import 'package:yemek1/data/models/category_model.dart';

class CategoryRepository {
  final CategoryApi api;
  CategoryRepository(this.api);
  Future<List<CategoryModel>> getKategoriler() {
    return api.getKategoriler();
  }
}
