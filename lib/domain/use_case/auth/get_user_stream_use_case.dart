import 'package:firebase_auth/firebase_auth.dart';

abstract interface class GetUserStreamUseCase {
  Stream<User?> get();
}
