import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yemek1/app/router/app_router.dart';
import 'package:yemek1/view/screens/category_screen.dart';
import 'package:yemek1/view/screens/home_screen.dart';

class AppView extends StatelessWidget {
  final Widget child;

  const AppView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.background,
        ),
        title: const Text(
          'Recipes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.local_restaurant_rounded, size: 30),
          onPressed: () {},
        ),
        actions: [
          Icon(Icons.home),
          TextButton(
            onPressed: () {
              context.go(AppRoutes.home); // GoRouter ile yönlendirme
            },
            child: const Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 28),
          Icon(Icons.menu),
          TextButton(
            onPressed: () {
              context.go(AppRoutes.category);
            },
            child: const Text(
              "Category",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(width: 15), // Sağdan biraz boşluk
        ],
      ),
      body: child,
    );
  }
}
