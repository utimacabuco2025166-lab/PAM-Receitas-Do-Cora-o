import '../../domain/entities/recipe.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../datasources/recipe_remote_data_source.dart';

class RecipeRepositoryImpl implements RecipeRepository{
  final RecipeRemoteDataSource remoteDataSource;

RecipeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Recipe>> searchRecipes(String query) async {

    //mais logica depois
    return await remoteDataSource.searchRecipes(query);
  }


@override
Future<Recipe> getRecipeDetail(int id) async {
//fazer depois
  throw UnimplementedError();
}
}