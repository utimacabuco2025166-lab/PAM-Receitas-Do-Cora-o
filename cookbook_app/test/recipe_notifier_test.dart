import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cookbook_app/features/recipes/domain/entities/recipe.dart';
import 'package:cookbook_app/features/recipes/domain/repositories/recipe_repository.dart';
import 'package:cookbook_app/features/recipes/presentation/providers/recipe_notifier.dart';
import 'package:cookbook_app/features/recipes/presentation/providers/recipe_providers.dart';

class FakeRecipeRepository implements RecipeRepository {
  @override
  Future<List<Recipe>> searchRecipes({
    required String query,
    required String sort,
    required String category,
  }) async {
    return [
      const Recipe(
        id: 1,
        title: 'Chicken Curry',
        image: 'https://example.com/curry.jpg',
        readyInMinutes: 25,
        servings: 3,
        summary: 'Spicy curry',
        ingredients: ['chicken', 'curry powder'],
      ),
    ];
  }
}

void main() {
  test('RecipeNotifier deve atualizar o estado com receitas encontradas', () async {
    final container = ProviderContainer(
      overrides: [
        recipeRepositoryProvider.overrideWithValue(FakeRecipeRepository()),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(recipeProvider.notifier);

    await notifier.search(query: 'curry', sort: 'none', category: 'all');

    final state = container.read(recipeProvider);

    expect(state.recipes.length, 1);
    expect(state.recipes.first.title, 'Chicken Curry');
    expect(state.isLoading, false);
  });
}