import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/device_id_provider.dart';

class FavoritesRemoteDataSource {
  Future<CollectionReference> _getUserCollection() async {
    final deviceId = await DeviceIdProvider.getDeviceId();
    return FirebaseFirestore.instance
        .collection('favorites')
        .doc(deviceId)
        .collection('recipes');
  }

  Future<List<String>> getFavoriteIds() async {
    final collection = await _getUserCollection();
    final snapshot = await collection.get();
    return snapshot.docs.map((doc) => doc.id).toList();
  }

  Future<void> addFavorite(String recipeId) async {
    final collection = await _getUserCollection();
    await collection.doc(recipeId).set({'favorited': true});
  }

  Future<void> removeFavorite(String recipeId) async {
    final collection = await _getUserCollection();
    await collection.doc(recipeId).delete();
  } 

  
  
  
}