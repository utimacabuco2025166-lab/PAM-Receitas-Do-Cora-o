import '../../domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  //um modelo de Recipe que aceita json
  const RecipeModel({
    required super.id,
    required super.title,
    required super.image,
    required super.readyInMinutes,
    required super.servings,
    required super.summary,
    required super.ingredients,
  });

  //trasnformar Json em objeto

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    // os valores de json sao substituidos
    return RecipeModel(
      id: json['id'] as int,
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      readyInMinutes: json['readyInMinutes'] as int? ?? 0,
      servings: json['servings'] as int? ?? 0,
      summary: json['summary'] as String? ?? '',
      ingredients:
          (json['extendedIngredients'] as List<dynamic>?)
              ?.map((item) => item['original'] as String)
              .toList() ??
          [],
    );
  }
}
