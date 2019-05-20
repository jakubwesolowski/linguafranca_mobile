import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rtimly/domain/category.dart';
import 'package:rtimly/resources/repository/category_repository.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class CategoryDetailDialog extends StatefulWidget {
  final Category category;
  final Function(String scaffoldMessage) notifyParent;

  CategoryDetailDialog({Key key, this.category, @required this.notifyParent})
      : super(key: key);

  _CategoryDetailDialogState createState() => _CategoryDetailDialogState();
}

class _CategoryDetailDialogState extends State<CategoryDetailDialog> {
  final CategoryRepository _repository =
      kiwi.Container().resolve<CategoryRepository>();

  final _descriptionEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // set initial value for text field
    _descriptionEditingController.text = widget.category.description;

    return AlertDialog(
      elevation: 4.0,
      content: Column(
        children: <Widget>[
          Text(
            widget.category.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          buildDifficultyDropdown(),
          TextField(
            controller: _descriptionEditingController,
            decoration: InputDecoration(
              hintText: 'Description',
            ),
          ),
          RaisedButton(
            child: Text('Save'),
            textColor: Colors.white,
            color: Colors.green,
            onPressed: () {
              setState(() {
                widget.category.description =
                    _descriptionEditingController.text;
              });
              widget.notifyParent('Category updated');
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
          RaisedButton(
            child: Text('Remove'),
            textColor: Colors.white,
            color: Colors.red,
            onPressed: () {
              _repository.removeCategory(widget.category);
              widget.notifyParent('Category removed');
              Navigator.of(context, rootNavigator: true).pop();
            },
          )
        ],
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
          widget.category.difficulty = value;
        });
      },
      value: widget.category.difficulty,
      isExpanded: true,
    );
  }
}
