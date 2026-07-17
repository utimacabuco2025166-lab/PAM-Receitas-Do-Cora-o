import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/favorites_notifier.dart';
import '../providers/recipe_providers.dart';
import '../../domain/entities/recipe.dart';
import 'recipe_details_page.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesProvider);
    final repository = ref.read(recipeRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Receitas Favoritas')),
      body: favoritesState.favoriteIds.isEmpty
          ? const Center(child: Text('Nenhuma receita favoritada ainda.'))
          : ListView.builder(
              itemCount: favoritesState.favoriteIds.length,
              itemBuilder: (context, index) {
                final id = favoritesState.favoriteIds[index];

                return FutureBuilder<Recipe>(
                  future: repository.getRecipeById(int.parse(id)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ListTile(title: Text('Carregando...'));
                    }
                    if (!snapshot.hasData) {
                      return ListTile(title: Text('Receita ID: $id (erro ao carregar)'));
                    }

                    final recipe = snapshot.data!;
                    return ListTile(
                      leading: recipe.image.isNotEmpty
                          ? Image.network(recipe.image, width: 50, height: 50, fit: BoxFit.cover)
                          : null,
                      title: Text(recipe.title),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetailsPage(recipe: recipe),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
    );
  }
}