import 'package:flutter/material.dart';
import 'package:yemek1/data/models/category_model.dart';

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget({super.key, required this.cat});

  final CategoryModel cat;

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5), // Üst ve alt boşluk
      child: ListTile(
        leading: Image.network(
          cat.imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        title: Text(
          cat.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: secondaryColor,
          ),
        ),
        subtitle: Text(
          cat.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
