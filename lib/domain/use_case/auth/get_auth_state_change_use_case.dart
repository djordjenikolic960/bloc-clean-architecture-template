import 'package:firebase_auth/firebase_auth.dart';

abstract interface class GetAuthStateChangeUseCase {
  Stream<User?> get();
}
