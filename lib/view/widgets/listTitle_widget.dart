import 'package:flutter/material.dart';
import 'package:yemek1/data/models/category_model.dart';

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget({super.key, required this.category, this.onTap});

  final CategoryModel category;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5), // Üst ve alt boşluk
      child: ListTile(
        leading: Image.network(
          category.imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        title: Text(
          category.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: secondaryColor,
          ),
        ),
        subtitle: Text(
          category.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: onTap,
      ),
    );
  }
}
