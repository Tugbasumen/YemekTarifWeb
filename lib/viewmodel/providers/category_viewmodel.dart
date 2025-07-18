import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek1/data/datasources/category_api.dart';
import 'package:yemek1/data/models/category_model.dart';
import 'package:yemek1/data/repositories/category_repository.dart';

final categoryViewmodelProvider =
    StateNotifierProvider<CategoryViewModel, AsyncValue<List<CategoryModel>>>((
      ref,
    ) {
      final api = CategoryApi();
      final repository = CategoryRepository(api);
      return CategoryViewModel(repository);
    });

class CategoryViewModel extends StateNotifier<AsyncValue<List<CategoryModel>>> {
  final CategoryRepository repository;

  CategoryViewModel(this.repository) : super(const AsyncValue.loading()) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final categories = await repository.getKategoriler();
      state = AsyncValue.data(categories);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
