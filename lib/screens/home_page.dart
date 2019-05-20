import 'package:flutter/material.dart';
import 'package:rtimly/authentication/auth_provider.dart';
import 'package:rtimly/screens/home/backdrop.dart';
import 'package:rtimly/screens/home/categories_page.dart';
import 'package:rtimly/screens/home/dashboard.dart';
import 'package:rtimly/screens/home/new_category_page.dart';
import 'package:rtimly/screens/home/settings_page.dart';

class HomePage extends StatefulWidget {
  HomePage({this.onSignedOut});

  final VoidCallback onSignedOut;

  @override
  _HomePageState createState() => _HomePageState(onSignedOut: onSignedOut);
}

class _HomePageState extends State<HomePage> {
  final VoidCallback onSignedOut;

  _HomePageState({this.onSignedOut});

  Widget _currentWidget = CategoriesPage();

  @override
  Widget build(BuildContext context) {
    return Backdrop(
      frontLayer: _currentWidget,
      backLayer: buildMenu(),
    );
  }

  void _signOut(BuildContext context) async {
    try {
      var auth = AuthProvider.of(context).auth;
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  void setWidget(Widget widget) {
    setState(() {
      _currentWidget = widget;
    });
  }

  Widget buildMenu() {
    return Center(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Dashboard'),
                onPressed: () {
                  setWidget(DashboardView(setParentWidget: setWidget));
                },
              ),
              RaisedButton(
                child: Text('New category'),
                onPressed: () {
                  setWidget(NewCategoryView());
                },
              ),
              RaisedButton(
                child: Text('Categories'),
                onPressed: () {
                  setWidget(CategoriesPage());
                },
              ),
              RaisedButton(
                child: Text('Settings'),
                onPressed: () {
                  setWidget(SettingsPage());
                },
              ),
              RaisedButton(
                child: Text('Logout'),
                onPressed: () {
                  _signOut(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
