import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User?> signIn(String email, String password) =>
      remoteDataSource.signIn(email, password);

  @override
  Future<User?> signUp(String email, String password) =>
      remoteDataSource.signUp(email, password);

  @override
  Future<void> signOut() => remoteDataSource.signOut();

  @override
  User? getCurrentUser() => remoteDataSource.getCurrentUser();
}