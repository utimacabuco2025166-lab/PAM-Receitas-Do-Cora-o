import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesRemoteDataSource {
  CollectionReference _getUserCollection() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('favorites')
        .doc(uid)
        .collection('recipes');
  }

  Future<List<String>> getFavoriteIds() async {
    final collection = _getUserCollection();
    final snapshot = await collection.get();
    return snapshot.docs.map((doc) => doc.id).toList();
  }

Future<void> addFavorite(String recipeId) async {
  final collection = _getUserCollection();
  final email = FirebaseAuth.instance.currentUser?.email;
  await collection.doc(recipeId).set({
    'favorited': true,
    'userEmail': email,
  });
}

  Future<void> removeFavorite(String recipeId) async {
    final collection = _getUserCollection();
    await collection.doc(recipeId).delete();
  }
}