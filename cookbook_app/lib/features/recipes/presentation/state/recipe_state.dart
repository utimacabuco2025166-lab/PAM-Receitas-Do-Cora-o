import '../../domain/entities/recipe.dart';

class RecipeState{
  final bool isLoading;
  final List<Recipe> recipes;
  final String? errorMessage;

  const RecipeState({
    required this.isLoading,
    required this.recipes,
    this.errorMessage,
  });

factory RecipeState.initial() => const RecipeState(
  isLoading: false,
  recipes: [],
  errorMessage: null,
);

RecipeState copyWith({
  bool? isLoading,
  List<Recipe>? recipes,
  String? errorMessage,
}){
  return RecipeState(
    isLoading: isLoading ?? this.isLoading,
    recipes: recipes ?? this.recipes,
    errorMessage: errorMessage ?? this.errorMessage,
  );

}
}