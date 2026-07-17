
import '../entities/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> searchRecipes({
    required String query,
    required String sort,
    required String category,
  });

  Future<Recipe> getRecipeById(int id);
}