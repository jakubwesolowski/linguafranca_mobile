import 'package:flutter/material.dart';
import 'package:rtimly/authentication/auth_provider.dart';
import 'package:rtimly/util/authorization_util.dart';

class EmailFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class FirstNameFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'First name can\'t be empty' : null;
  }
}

class LastNameFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Last name can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({this.onSignedIn, this.loader, this.returnToLogin});

  final VoidCallback onSignedIn;
  final VoidCallback loader;
  final VoidCallback returnToLogin;

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType {
  login,
  register,
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  String _firstName;
  String _lastName;
  FormType _formType = FormType.login;

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  void validateAndSubmit() async {
    if (AuthUtil().validateAndSave(formKey)) {
      tryLogin();
    } else {
      // TODO show notification
    }
  }

  void tryLogin() async {
    try {
      var auth = AuthProvider.of(context).auth;
      if (_formType == FormType.login) {
        widget.loader();
        bool loggedIn = await AuthUtil().signIn(auth, _email, _password);

        if (loggedIn) {
          print('Logged in!');
          widget.onSignedIn();
        } else {
          widget.returnToLogin();
          print('Error');
        }
      } else if (_formType == FormType.register) {
        widget.loader();
        await AuthUtil()
            .register(auth, _firstName, _lastName, _email, _password);
        widget.returnToLogin();
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  List<Widget> buildInputs() {
    if (_formType == FormType.login) {
      return [
        TextFormField(
          key: Key('email'),
          decoration: InputDecoration(labelText: 'Email'),
          validator: EmailFieldValidator.validate,
          onSaved: (value) => _email = value,
        ),
        TextFormField(
          key: Key('password'),
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
          validator: PasswordFieldValidator.validate,
          onSaved: (value) => _password = value,
        ),
      ];
    } else {
      return [
        TextFormField(
          key: Key('firstName'),
          decoration: InputDecoration(labelText: 'First name'),
          validator: FirstNameFieldValidator.validate,
          onSaved: (value) => _firstName = value,
        ),
        TextFormField(
          key: Key('lastName'),
          decoration: InputDecoration(labelText: 'Last name'),
          validator: LastNameFieldValidator.validate,
          onSaved: (value) => _lastName = value,
        ),
        TextFormField(
          key: Key('email'),
          decoration: InputDecoration(labelText: 'Email'),
          validator: EmailFieldValidator.validate,
          onSaved: (value) => _email = value,
        ),
        TextFormField(
          key: Key('password'),
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
          validator: PasswordFieldValidator.validate,
          onSaved: (value) => _password = value,
        ),
      ];
    }
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        RaisedButton(
          key: Key('signIn'),
          color: Theme.of(context).buttonColor,
          child: Text('Login', style: TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        RaisedButton(
          color: Theme.of(context).buttonColor,
          child: Text('Create an account', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return [
        RaisedButton(
          child: Text('Create an account', style: TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        RaisedButton(
          child:
              Text('Have an account? Login', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LinguaFranca Login'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('graphics/logo.png')),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: buildInputs() + buildSubmitButtons(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
