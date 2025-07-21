import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yemek1/data/models/category_model.dart';
import 'package:yemek1/view/widgets/app_view.dart';
import 'package:yemek1/view/widgets/listTitle_widget.dart';
import 'package:yemek1/view/widgets/loading_widget.dart';
import 'package:yemek1/viewmodel/providers/category_viewmodel.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryState = ref.watch(categoryViewmodelProvider);

    return Scaffold(
      body: AppView(
        child: LoadingView<List<CategoryModel>>(
          state: categoryState,
          onData: (categories) => ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final cat = categories[index];
              return ListTitleWidget(
                category: cat,
                onTap: () {
                  context.push('/category/${cat.name}');
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
