import 'package:dio/dio.dart';

import '../models/recipe_model.dart';

abstract class RecipeRemoteDataSource {
  Future<List<RecipeModel>> searchRecipes(String query);  //
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final Dio dio;
  final String apiKey = '4fa297a4d1be4b88a3c9eaa603a93dfa'; 

  RecipeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<RecipeModel>> searchRecipes(String query) async {
    final response = await dio.get(
      'https://api.spoonacular.com/recipes/complexSearch',
      queryParameters: {
        'query': query,
        'apiKey': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List results = response.data['results'];
      return results.map((json) => RecipeModel.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao buscar receitas: ${response.statusCode}');
    }
  }
}