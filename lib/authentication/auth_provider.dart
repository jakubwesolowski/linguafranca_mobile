import 'package:flutter/material.dart';
import 'package:rtimly/authentication/auth.dart';

enum FormType {
  login,
  register,
}

class AuthProvider extends InheritedWidget {
  AuthProvider({Key key, Widget child, this.auth})
      : super(key: key, child: child);
  final BaseAuth auth;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AuthProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AuthProvider) as AuthProvider);
  }
}
