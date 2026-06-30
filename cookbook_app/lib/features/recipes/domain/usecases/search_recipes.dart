import '../entities/recipe.dart';
import '../repositories/recipe_repository.dart';

class SearchRecipes {//usercase de procurar receita
  final RecipeRepository repository;

  SearchRecipes(this.repository);

  Future<List<Recipe>> call(String query){
    return repository.searchRecipes(query);
  }
}