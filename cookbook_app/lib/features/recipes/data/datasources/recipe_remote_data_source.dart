import 'package:dio/dio.dart';
import '../models/recipe_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



abstract class RecipeRemoteDataSource {
  Future<List<RecipeModel>> searchRecipes({ //todos os searchRecipes vao ter que implementar essa função
    required String query,
    required String sort,
    required String category,
  }); 
  Future<RecipeModel> getRecipeById(int id);
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource { // faz o que esta a cima
  final Dio dio;// contacto com a internet, para fazer requisições http
  final String apiKey = dotenv.env['SPOONACULAR_API_KEY']!;
//TODO: esconder a apikey

  RecipeRemoteDataSourceImpl(this.dio);

  @override
  Future<List<RecipeModel>> searchRecipes({//rebecebe os parametros
  required String query,
  required String sort,
  required String category,
})async {
    final response = await dio.get(//devolve a resposta
      'https://api.spoonacular.com/recipes/complexSearch',
      queryParameters: {//informacoes que vao ser passadas para a url, como se fosse um filtro
        'query': query,
        'apiKey': apiKey,
        // Limite de resultados
        'number': 3, 
        'addRecipeInformation': true,
        'fillIngredients': true,
        'language': 'pt',
        if (sort != 'none')'sort': sort,
        if (sort == 'title') 'sortDirection': 'asc',
        if (category != 'all') 'type': category,

      },
    );

    if (response.statusCode == 200) {
      final List results = response.data['results'] as List;
      return results
          .map((json) => RecipeModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Falha ao carregar receitas');
    }

    

  } 
  Future<RecipeModel> getRecipeById(int id) async {
  final response = await dio.get(
    'https://api.spoonacular.com/recipes/$id/information',
    queryParameters: {
      'apiKey': dotenv.env['SPOONACULAR_API_KEY']!,
    },
  );
  return RecipeModel.fromJson(response.data);
}



}