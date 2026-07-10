import 'package:flutter_test/flutter_test.dart';
import 'package:cookbook_app/features/recipes/domain/entities/recipe.dart';
import 'package:cookbook_app/features/recipes/domain/repositories/recipe_repository.dart';
import 'package:cookbook_app/features/recipes/domain/usecases/search_recipes.dart';

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
        title: 'Pasta Carbonara',
        image: 'https://example.com/pasta.jpg',
        readyInMinutes: 20,
        servings: 2,
        summary: 'Delicious pasta',
        ingredients: ['pasta', 'egg', 'bacon'],
      ),
    ];
  }
}

void main() {
  test('SearchRecipes deve devolver lista de receitas do repository', () async {
    final repository = FakeRecipeRepository();
    final useCase = SearchRecipes(repository);

    final result = await useCase.call(
      query: 'pasta',
      sort: 'none',
      category: 'all',
    );

    expect(result.length, 1);
    expect(result.first.title, 'Pasta Carbonara');
  });
}