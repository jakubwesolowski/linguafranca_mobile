import 'package:flutter/material.dart';
import 'package:rtimly/authentication/auth.dart';
import 'package:rtimly/authentication/auth_provider.dart';
import 'package:rtimly/resources/repository/category_repository.dart';
import 'package:rtimly/screens/root_page.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    registerContainer();

    return AuthProvider(
        auth: Auth(),
        child: new MaterialApp(
          title: 'LingueaFranca',
          theme: new ThemeData(
              primarySwatch: Colors.lime, brightness: Brightness.light),
          home: new RootPage(),
        ));
  }

  void registerContainer() {
    kiwi.Container container = new kiwi.Container();

    container.clear(); // only in dev env for quick reload
    container.registerInstance<CategoryRepository, CategoryRepositoryImpl>(
        CategoryRepositoryImpl());
  }
}
