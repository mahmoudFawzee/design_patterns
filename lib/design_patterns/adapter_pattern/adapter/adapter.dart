import 'dart:convert';

import 'package:design_patterns/design_patterns/adapter_pattern/apis/custom_user.dart';
import 'package:design_patterns/design_patterns/adapter_pattern/apis/facebook_user.dart';
import 'package:design_patterns/design_patterns/adapter_pattern/apis/google_user.dart';
import 'package:design_patterns/design_patterns/adapter_pattern/json_keys.dart';
import 'package:design_patterns/design_patterns/adapter_pattern/models/user.dart';
import 'package:design_patterns/design_patterns/adapter_pattern/apis/user_api.dart';

class GoogleUserAdapter implements UserAPI {
  @override
  List<User> getUsers() {
    final responseBody = GoogleUsersApi.getUsers();
    final usersList = json.decode(responseBody) as List;
    return usersList.map<User>((user) {
      final name = user[JsonKeys.firstName] + ' ' + user[JsonKeys.lastName];
      final imageUrl = user[JsonKeys.imageUrl];
      final email = user[JsonKeys.email];
      return User(
        name: name,
        bio: null,
        imageUrl: imageUrl,
        phoneNumber: null,
        email: email,
      );
    }).toList();
  }
}

class FacebookUserAdapter implements UserAPI {
  @override
  List<User> getUsers() {
    final responseBody = FacebookUsersApi.getUsers();
    final usersList = json.decode(responseBody) as List;
    return usersList.map<User>((user) {
      final name = user[JsonKeys.name];
      final imageUrl = user[JsonKeys.imageUrl];
      final email = user[JsonKeys.email];
      final phoneNumber = user[JsonKeys.phoneNumber];
      return User(
        name: name,
        bio: null,
        imageUrl: imageUrl,
        phoneNumber: phoneNumber,
        email: email,
      );
    }).toList();
  }
}

class CustomUserAdapter implements UserAPI {
  @override
  List<User> getUsers() {
    final responseBody = CustomUsersApi.getUsers();
    final usersList = json.decode(responseBody) as List;
    return usersList.map<User>((user) {
      final name = user[JsonKeys.name];
      final imageUrl = user[JsonKeys.imageUrl];
      final email = user[JsonKeys.email];
      final phoneNumber = user[JsonKeys.phoneNumber];
      final bio = user[JsonKeys.description];
      return User(
        name: name,
        bio: bio,
        imageUrl: imageUrl,
        phoneNumber: phoneNumber,
        email: email,
      );
    }).toList();
  }
}
