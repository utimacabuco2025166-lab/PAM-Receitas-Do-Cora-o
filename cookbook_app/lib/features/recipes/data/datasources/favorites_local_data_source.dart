import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesRemoteDataSource {
  final _collection = FirebaseFirestore.instance.collection('favorites');

  // Devolve a lista de IDs favoritados
  Future<List<String>> getFavoriteIds() async {
    final snapshot = await _collection.get();
    return snapshot.docs.map((doc) => doc.id).toList();
  }

  // Adiciona um ID à lista de favoritos
  Future<void> addFavorite(String recipeId) async {
    await _collection.doc(recipeId).set({'favorited': true});
  }

  // Remove um ID da lista de favoritos
  Future<void> removeFavorite(String recipeId) async {
    await _collection.doc(recipeId).delete();
  }
}