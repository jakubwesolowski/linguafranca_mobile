import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rtimly/authentication/auth.dart';

class AuthUtil {
  bool validateAndSave(GlobalKey<FormState> formKey) {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<bool> signIn(BaseAuth auth, String email, String password) async {
    return auth.signInWithEmailAndPassword(email, password);

//    print('Signed in: $userId');
  }

  Future<String> register(BaseAuth auth, String firstName, String lastName,
      String email, String password) async {
    return auth.createUserWithEmailAndPassword(
        firstName, lastName, email, password);
  }
}
