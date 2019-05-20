import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rtimly/domain/category.dart';
import 'package:rtimly/resources/repository/category_repository.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class NewCategoryView extends StatefulWidget {
  _NewCategoryViewState createState() => _NewCategoryViewState();
}

class _NewCategoryViewState extends State<NewCategoryView> {
  final CategoryRepository _repository =
      kiwi.Container().resolve<CategoryRepository>();

  final _categoryNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _difficulty = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
      child: Center(
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _categoryNameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Category name cannot by empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'category name',
                  ),
                ),
                buildDifficultyDropdown(),
                RaisedButton(
                  key: Key('addCategory'),
                  color: Theme.of(context).buttonColor,
                  child: Text('Add', style: TextStyle(fontSize: 20.0)),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _repository
                          .addCategory(Category(_categoryNameController.text,
                              "", null, true, _difficulty))
                          .whenComplete(() {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Category added')));
                        _categoryNameController.clear();
                      });
                    }
                  },
                ),
              ],
            )),
      ),
    );
  }

  DropdownButton buildDifficultyDropdown() {
    return DropdownButton<int>(
      items: [
        DropdownMenuItem<int>(
          value: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Difficulty 1"),
              SizedBox(width: 10),
              Icon(FontAwesomeIcons.diceOne),
            ],
          ),
        ),
        DropdownMenuItem<int>(
          value: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Difficulty 2"),
              SizedBox(width: 10),
              Icon(FontAwesomeIcons.diceTwo),
            ],
          ),
        ),
        DropdownMenuItem<int>(
          value: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Difficulty 3"),
              SizedBox(width: 10),
              Icon(FontAwesomeIcons.diceThree),
            ],
          ),
        ),
        DropdownMenuItem<int>(
          value: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Difficulty 4"),
              SizedBox(width: 10),
              Icon(FontAwesomeIcons.diceFour),
            ],
          ),
        ),
        DropdownMenuItem<int>(
          value: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Difficulty 5"),
              SizedBox(width: 10),
              Icon(FontAwesomeIcons.diceFive),
            ],
          ),
        ),
        DropdownMenuItem<int>(
          value: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Difficulty 6"),
              SizedBox(width: 10),
              Icon(FontAwesomeIcons.diceSix),
            ],
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          _difficulty = value;
        });
      },
      value: _difficulty,
      isExpanded: true,
    );
  }
}
