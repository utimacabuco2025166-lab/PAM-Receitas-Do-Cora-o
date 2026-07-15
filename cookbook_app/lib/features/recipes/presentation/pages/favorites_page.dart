import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/favorites_notifier.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('RecFavorite Recipes')),
      body: favoritesState.favoriteIds.isEmpty
          ? const Center(child: Text('No favorite recipes yet.'))
          : ListView.builder(
              itemCount: favoritesState.favoriteIds.length,
              itemBuilder: (context, index) {
                final id = favoritesState.favoriteIds[index];
                return ListTile(
                  title: Text('Recipe ID: $id'),
                );
              },
            ),
    );
  }
}