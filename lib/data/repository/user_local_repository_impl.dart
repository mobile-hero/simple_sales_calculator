import 'package:simple_sales_calculator/data/models/user.dart';
import 'package:simple_sales_calculator/data/repository/user_local_repository.dart';

import '../../objectbox.g.dart';

class UserLocalRepositoryImpl extends UserLocalRepository {

  @override
  int createUser(Store store, User user) {
    final box = store.box<User>();
    return box.put(user);
  }

  @override
  bool deleteUser(Store store, String email) {
    final box = store.box<User>();
    final user = box.query(User_.email.equals(email)).build().findFirst();
    if (user != null) {
      return box.remove(user.id!);
    }
    return false;
  }

  @override
  User? getUser(Store store, String email, String password) {
    final box = store.box<User>();
    return box.query(
        User_.email.equals(email) & User_.password.equals(password))
        .build()
        .findFirst();
  }
}