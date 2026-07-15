import 'package:flutter/material.dart';
import '../../domain/entities/recipe.dart';
import 'package:flutter_html/flutter_html.dart';
import '../providers/favorites_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeDetailsPage extends ConsumerWidget {
  //essa pagina nao guarda estados, ou seja, nao muda nnada
  final Recipe recipe; // ja recebe uma receita para mostrar os detalhes dela

  

  const RecipeDetailsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesProvider);
final isFavorite = favoritesState.isFavorite(recipe.id.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              ref.read(favoritesProvider.notifier).toggleFavorite(recipe.id.toString());
            },
          ),
        ],
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (recipe.image.isNotEmpty)
              Image.network(
                recipe.image,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Html(
                    data: recipe.summary,
                    style: {
                      "a": Style(
                        color: Colors.black,
                        textDecoration: TextDecoration.none,
                      ),
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Ingredients:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...recipe.ingredients.map(
                    (ingredient) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text('• $ingredient'),
                    ),
                  ),
                  Text(
                    'Prep Time: ${recipe.readyInMinutes} min',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Portions: ${recipe.servings}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
