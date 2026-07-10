// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecipeNotifier)
final recipeProvider = RecipeNotifierProvider._();

final class RecipeNotifierProvider
    extends $NotifierProvider<RecipeNotifier, RecipeState> {
  RecipeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recipeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recipeNotifierHash();

  @$internal
  @override
  RecipeNotifier create() => RecipeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecipeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecipeState>(value),
    );
  }
}

String _$recipeNotifierHash() => r'6b217096585a8ed31b25369ebe924d1c2f6a0a9b';

abstract class _$RecipeNotifier extends $Notifier<RecipeState> {
  RecipeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<RecipeState, RecipeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RecipeState, RecipeState>,
              RecipeState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
