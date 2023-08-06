import 'package:design_patterns/design_patterns/adapter_pattern/adapter/adapter.dart';
import 'package:design_patterns/design_patterns/adapter_pattern/models/user.dart';

abstract class UserAPI {
  List<User> getUsers();
}

class MyUserApi implements UserAPI {
  @override
  List<User> getUsers() {
    final googleUserAdapter = GoogleUserAdapter();
    final facebookUserAdapter = FacebookUserAdapter();
    final customUserAdapter = CustomUserAdapter();
    final users = [
      ...googleUserAdapter.getUsers(),
      ...facebookUserAdapter.getUsers(),
      ...customUserAdapter.getUsers()
    ];
    return users;
  }
}
