import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../state/favorites_state.dart';
import '../../data/datasources/favorites_local_data_source.dart';

part 'favorites_notifier.g.dart';

@riverpod
class FavoritesNotifier extends _$FavoritesNotifier {
  final _dataSource = FavoritesRemoteDataSource();

  @override
  FavoritesState build() {
    _loadFavorites(); 
    return FavoritesState.initial();
  }

  Future<void> _loadFavorites() async {
    final ids = await _dataSource.getFavoriteIds();
    state = state.copyWith(favoriteIds: ids);
  }

  Future<void> toggleFavorite(String recipeId) async {
    if (state.isFavorite(recipeId)) {
      await _dataSource.removeFavorite(recipeId);
    } else {
      await _dataSource.addFavorite(recipeId);
    }
    final updatedIds = await _dataSource.getFavoriteIds();
    state = state.copyWith(favoriteIds: updatedIds);
  }
}