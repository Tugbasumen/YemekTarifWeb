import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yemek1/view/screens/category_recipe_screen.dart';
import 'package:yemek1/view/screens/category_screen.dart';
import 'package:yemek1/view/screens/home_screen.dart';
import 'package:yemek1/view/screens/recipe_detail_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String recipeDetail = '/recipe_detail/:id';
  static const String category = '/category';
  static const String categoryDetail = '/category/:name';
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.recipeDetail,
      builder: (context, state) {
        final id = state.pathParameters['id']!; // ID parametresini al
        return RecipeDetailScreen(recipeId: id); // ID'yi ekrana gönder
      },
    ),
    GoRoute(
      path: AppRoutes.category,
      builder: (context, state) => const CategoryScreen(),
    ),
    GoRoute(
      path: AppRoutes.categoryDetail,
      builder: (context, state) {
        final categoryName = state.pathParameters['name']!;
        return CategoryRecipeScreen(category: categoryName);
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    // Hata sayfası eklendi
    body: Center(child: Text('Page not found: ${state.uri.path}')),
  ),
);
