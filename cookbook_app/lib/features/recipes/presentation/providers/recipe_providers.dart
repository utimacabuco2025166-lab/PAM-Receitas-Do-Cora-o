import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/recipe_remote_data_source.dart';
import '../../data/repositories/recipe_repository_impl.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../../../../core/utils/providers.dart';

part 'recipe_providers.g.dart';

@riverpod
RecipeRepository recipeRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  final dataSource = RecipeRemoteDataSourceImpl(dio);
  return RecipeRepositoryImpl(dataSource);
}