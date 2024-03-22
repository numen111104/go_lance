import 'package:go_lance/entitles/user.dart';
import 'package:go_lance/objectbox.g.dart';

class UserRepository {
  final Store store;
  UserRepository({required this.store});

  int addOrUpdateUser(User user) {
    return store.box<User>().put(user);
  }

  User? getUserByName(String fullname) {
    List<User> users = store.box<User>().query(User_.name.equals(fullname)).build().find();
    if (users.isNotEmpty) {
      return users.first;
    }
    return null;
  }

  User? getUserById(int id) {
    return store.box<User>().get(id);
  }
}