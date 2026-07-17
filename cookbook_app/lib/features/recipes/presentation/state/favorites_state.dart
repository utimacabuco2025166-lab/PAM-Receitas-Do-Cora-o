class FavoritesState {
  final List<String> favoriteIds; //guarda na mamoria 

  const FavoritesState({required this.favoriteIds});

  factory FavoritesState.initial() => const FavoritesState(favoriteIds: []);

  bool isFavorite(String recipeId) => favoriteIds.contains(recipeId); // essa receita esta favoritada?

  FavoritesState copyWith({List<String>? favoriteIds}) {
    return FavoritesState(
      favoriteIds: favoriteIds ?? this.favoriteIds,
    );
  }
}