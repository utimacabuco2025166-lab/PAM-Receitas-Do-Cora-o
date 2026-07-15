import '../../domain/entities/recipe.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../datasources/recipe_remote_data_source.dart';

class RecipeRepositoryImpl implements RecipeRepository{
  //erro em RecipeRepositoryImpl
  final RecipeRemoteDataSource remoteDataSource;

RecipeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Recipe>> searchRecipes({
    //erro em searchRecipes
    required String query,
    required String sort,
    required String category,
  }) async {
  final models = await remoteDataSource.searchRecipes(
      query: query,
      sort: sort,
      category: category,
      
    );
  return models.cast<Recipe>().toList();
  }
}
