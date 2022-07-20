import '../../objectbox.g.dart';
import '../models/user.dart';

abstract class UserLocalRepository {
  int createUser(Store store, User user);
  bool deleteUser(Store store, String email);
  User? getUser(Store store, String email, String password);
}