import '../entities/recipe.dart';
import '../repositories/recipe_repository.dart';

class SearchRecipes {//usercase de procurar receita
  final RecipeRepository repository;

  SearchRecipes(this.repository);

  Future<List<Recipe>> call({
    required String query,
    required String sort,
    required String category,
  }) {
    return repository.searchRecipes(
      query: query,
      sort: sort,
      category: category,
    );
  }
}