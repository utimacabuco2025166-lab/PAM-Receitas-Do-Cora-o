import 'package:shared_preferences/shared_preferences.dart';

class FavoritesLocalDataSource {
  static const String _key = 'favorite_recipe_ids';

  // Devolve a lista de IDs favoritados, guardados como texto
  Future<List<String>> getFavoriteIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  // Adiciona um ID à lista de favoritos
  Future<void> addFavorite(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    final ids = prefs.getStringList(_key) ?? [];
    if (!ids.contains(recipeId)) {
      ids.add(recipeId);
      await prefs.setStringList(_key, ids);
    }
  }

  // Remove um ID da lista de favoritos
  Future<void> removeFavorite(String recipeId) async {
    final prefs = await SharedPreferences.getInstance();
    final ids = prefs.getStringList(_key) ?? [];
    ids.remove(recipeId);
    await prefs.setStringList(_key, ids);
  }
}