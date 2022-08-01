import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_clean_bloc/user/model/user.dart';
import 'package:firebase_clean_bloc/user/repository/user.dart';

final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

final userRef =
    FirebaseFirestore.instance.collection('users').withConverter<User>(
          fromFirestore: (snapshots, _) =>
              User.fromMap(snapshots.data()!, snapshots.id),
          toFirestore: (user, _) => user.toFirebaseMap(),
        );

class UserRepository implements UserBaseRepository {
  @override
  Stream<List<User>> getUsers() {
    return userRef
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  @override
  Future<String> createUser(User user) {
    return userRef.add(user).then((doc) => doc.id);
  }
}
