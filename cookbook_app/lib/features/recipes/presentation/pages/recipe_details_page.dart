import 'package:flutter/material.dart';
import '../../domain/entities/recipe.dart';
import 'package:flutter_html/flutter_html.dart';

class RecipeDetailsPage extends StatelessWidget {
  //essa pagina nao guarda estados, ou seja, nao muda nnada
  final Recipe recipe; // ja recebe uma receita para mostrar os detalhes dela

  const RecipeDetailsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
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
