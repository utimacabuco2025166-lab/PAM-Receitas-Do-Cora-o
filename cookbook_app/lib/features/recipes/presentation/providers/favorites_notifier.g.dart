// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavoritesNotifier)
final favoritesProvider = FavoritesNotifierProvider._();

final class FavoritesNotifierProvider
    extends $NotifierProvider<FavoritesNotifier, FavoritesState> {
  FavoritesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesNotifierHash();

  @$internal
  @override
  FavoritesNotifier create() => FavoritesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FavoritesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FavoritesState>(value),
    );
  }
}

String _$favoritesNotifierHash() => r'82c4b81cb8862e3e1c3c31cce8a3404481581aac';

abstract class _$FavoritesNotifier extends $Notifier<FavoritesState> {
  FavoritesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<FavoritesState, FavoritesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FavoritesState, FavoritesState>,
              FavoritesState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
