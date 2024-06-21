import '../../../model/user_model.dart';
import 'user_remote_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  static const userCollection = "users";
  final FirebaseFirestore _firebaseFirestore;

  UserRemoteDataSourceImpl(this._firebaseFirestore);

  @override
  Future<void> saveUser(UserModel user) async {
    await _firebaseFirestore
        .collection(userCollection)
        .doc(user.id)
        .set(user.toJson());
  }

  @override
  Future<UserModel?> getUser(String id) async {
    final doc =
        await _firebaseFirestore.collection(userCollection).doc(id).get();
    if (doc.exists) {
      return UserModel.fromJson(doc.data()!);
    }
    return null;
  }

  @override
  Stream<UserModel?> getUserAsStream(String id) {
    return _firebaseFirestore
        .collection(userCollection)
        .doc(id)
        .snapshots()
        .map((snapshot) {
      return snapshot.exists ? UserModel.fromJson(snapshot.data()!) : null;
    });
  }
}
