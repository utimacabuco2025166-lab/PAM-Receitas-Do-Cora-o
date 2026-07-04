import '../../domain/entities/recipe.dart';

class RecipeModel  extends Recipe{
  const RecipeModel({
    required super.id,
    required super.title,
    required super.image,
    required super.readyInMinutes,
    required super.servings,
    required super.summary,
});

//trasnformar Json em objeto 

factory RecipeModel.fromJson(Map<String, dynamic> json) {
  return RecipeModel(
    id: json['id'],
    title: json['title']?? '',
    image: json['image'] ?? '',
    readyInMinutes: json['readyInMinutes'] ?? 0,
    servings: json['servings'] ?? 0,
    summary: json['summary']?? '',
  );
}
}