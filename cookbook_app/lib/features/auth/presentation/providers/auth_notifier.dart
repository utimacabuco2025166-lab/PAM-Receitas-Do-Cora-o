import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_providers.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  User? build() {
    return ref.read(authRepositoryProvider).getCurrentUser();
  }

  Future<void> signIn(String email, String password) async {
    final repository = ref.read(authRepositoryProvider);
    final user = await repository.signIn(email, password);
    state = user;
  }

  Future<void> signUp(String email, String password) async {
    final repository = ref.read(authRepositoryProvider);
    final user = await repository.signUp(email, password);
    state = user;
  }

  Future<void> signOut() async {
    final repository = ref.read(authRepositoryProvider);
    await repository.signOut();
    state = null;
  }
}