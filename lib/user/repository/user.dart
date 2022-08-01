import 'package:firebase_clean_bloc/user/model/user.dart';

abstract class UserBaseRepository {
  Stream<List<User>> getUsers();
  Future<String> createUser(User user);
}
