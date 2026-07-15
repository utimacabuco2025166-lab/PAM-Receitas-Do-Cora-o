import '../../domain/entities/recipe.dart';

enum RecipeSort {
  none,
  titleAsc,
  timeAsc,
  timeDesc,
}

class RecipeState {
  final bool isLoading;
  final List<Recipe> recipes;
  final String? errorMessage;
  final RecipeSort sortBy;
  final bool onlyQuickRecipes;

  const RecipeState({
    required this.isLoading,
    required this.recipes,
    this.errorMessage,
    this.sortBy = RecipeSort.none,
    this.onlyQuickRecipes = false,
  });

  factory RecipeState.initial() => const RecipeState(
        isLoading: false,
        recipes: [],
        errorMessage: null,
        sortBy: RecipeSort.none,
        onlyQuickRecipes: false,
      );

  RecipeState copyWith({
    bool? isLoading,
    List<Recipe>? recipes,
    String? errorMessage,
    RecipeSort? sortBy,
    bool? onlyQuickRecipes,
  }) {
    return RecipeState(
      isLoading: isLoading ?? this.isLoading,
      recipes: recipes ?? this.recipes,
      errorMessage: errorMessage,
      sortBy: sortBy ?? this.sortBy,
      onlyQuickRecipes: onlyQuickRecipes ?? this.onlyQuickRecipes,
    );
  }

  List<Recipe> get visibleRecipes {
    var list = [...recipes];

    if (onlyQuickRecipes) {
      list = list.where((r) => r.readyInMinutes <= 30).toList();
    }

    switch (sortBy) {
      case RecipeSort.titleAsc:
        list.sort((a, b) => a.title.compareTo(b.title));
        break;
      case RecipeSort.timeAsc:
        list.sort((a, b) => a.readyInMinutes.compareTo(b.readyInMinutes));
        break;
      case RecipeSort.timeDesc:
        list.sort((a, b) => b.readyInMinutes.compareTo(a.readyInMinutes));
        break;
      case RecipeSort.none:
        break;
    }

    return list;
  }
}