import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yemek1/view/widgets/app_view.dart';
import 'package:yemek1/view/widgets/loading_widget.dart';
import 'package:yemek1/view/widgets/recipe_card.dart';
import 'package:yemek1/view/widgets/recipe_grid_view.dart';
import 'package:yemek1/viewmodel/providers/recipe_viewmodel.dart';

/// Arama metnini tutan provider
final searchQueryProvider = StateProvider<String>((ref) => '');

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Sayfa her açıldığında arama sıfırlandı
    Future.microtask(() {
      ref.read(searchQueryProvider.notifier).state = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final recipeState = ref.watch(recipeViewModelProvider);

    return Scaffold(
      body: AppView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Arama alanı
              SizedBox(
                width: 400,
                child: TextField(
                  decoration: arama(),
                  onChanged: (value) {
                    ref.read(searchQueryProvider.notifier).state = value;
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Tarifleri göster
              Expanded(
                child: LoadingView(
                  state: recipeState,
                  onData: (recipes) {
                    final query = ref.watch(searchQueryProvider).toLowerCase();
                    final filteredRecipes = recipes
                        .where(
                          (recipe) => recipe.name.toLowerCase().contains(query),
                        )
                        .toList();
                    // Eğer hiçbir tarif bulunamadıysa
                    if (filteredRecipes.isEmpty) {
                      return const Center(
                        child: Text(
                          'No recipe found!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      );
                    }
                    //Tarifler bulunduysa

                    return RecipeGridView(
                      recipes: filteredRecipes,
                      onTap: (recipe) {
                        context.go('/recipe_detail/${recipe.id}');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration arama() {
    return InputDecoration(
      hintText: "Search by recipe name...",
      prefixIcon: const Icon(Icons.search),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.orange, // Pasif kenar rengi
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2),
      ),

      filled: true,
      fillColor: Colors.white,
    );
  }
}
