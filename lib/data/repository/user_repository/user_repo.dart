import 'package:the_exchange_online/data/models/user_model.dart';

abstract class UserRepository {

  Stream<UserModel> loggedUserStream(UserModel loggedUser);

  Future<UserModel> getUserById(String uid);

  Future<void> addUserData(UserModel newUser);

  Future<void> removeUserData(UserModel userModel);

  Future<void> updateUserData(UserModel updatedUser);
}
