import 'dart:async';

import 'package:rtimly/domain/user.dart';

abstract class BaseAuth {
  Future<bool> signInWithEmailAndPassword(String email, String password);

  Future<String> createUserWithEmailAndPassword(
      String firstName, String lastName, String email, String password);

  Future<User> currentUser();

  Future<void> signOut();
}

// TODO connect to database
class Auth implements BaseAuth {
  List<User> _users = new List<User>();
  User _currentUser;

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    return new Future.delayed(const Duration(seconds: 2), () {
//      User user =
//          _users.singleWhere((user) => user.email == email, orElse: () => null);
//
//      if (user == null || user.password != password) {
//        return false;
//      }
//
//      if (user != null && user.password == password) {
//        _currentUser = user;
//        return true;
//      }
      return true;
    });

//    return new Future.delayed(const Duration(seconds: 2), () => "login wait 1");
  }

  Future<String> createUserWithEmailAndPassword(
      String firstName, String lastName, String email, String password) async {
    return new Future.delayed(const Duration(seconds: 2), () {
      _users.add(new User(firstName, lastName, email, password));
      return "User created!\nPlease log in";
    });

//    return new Future.delayed(
//        const Duration(seconds: 2), () => "register wait 1");
  }

  Future<User> currentUser() async {
    return _currentUser;
  }

  Future<void> signOut() async {
    _currentUser = null;
  }
}
