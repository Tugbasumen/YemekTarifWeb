import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingView<T> extends StatelessWidget {
  final AsyncValue<T> state;
  final Widget Function(T data) onData;

  const LoadingView({super.key, required this.state, required this.onData});

  @override
  Widget build(BuildContext context) {
    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text("Hata: $error")),
      data: onData,
    );
  }
}
