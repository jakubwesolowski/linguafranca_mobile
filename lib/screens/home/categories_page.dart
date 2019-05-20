import 'package:flutter/material.dart';
import 'package:rtimly/blocs/category_bloc.dart';
import 'package:rtimly/domain/category.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rtimly/dto/category_model.dart';
import 'package:rtimly/screens/home/category_detail_page.dart';

class CategoriesPage extends StatefulWidget {
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllCategories();
    return Container(
      padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
      child: StreamBuilder<CategoryModel>(
        stream: bloc.allCategories,
        builder: (context, AsyncSnapshot<CategoryModel> snapshot) {
          if (snapshot.hasData) {
            return buildList(context, snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(
      BuildContext context, AsyncSnapshot<CategoryModel> snapshot) {
    if (snapshot.data.categories.length == 0) {
      return Center(
          child: Text(
        "No categories",
        style: TextStyle(fontSize: 25),
      ));
    } else {
      return Center(
          child: ListView.builder(
        itemCount: snapshot.data.categories.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, position) {
          return buildCategoryCard(context, snapshot.data.categories[position]);
        },
      ));
    }
  }

  Card buildCategoryCard(BuildContext context, Category category) {
    final makeListTile = ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.black12))),
        child: buildIconFromDifficulty(category.difficulty),
      ),
      title: Text(
        category.name,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return CategoryDetailDialog(
                category: category,
                notifyParent: refresh,
              );
            });
      },
    );

    return Card(
      elevation: 4.0,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: makeListTile,
      ),
    );
  }

  Widget buildCategory(Category category) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(category.name),
        SizedBox(width: 10),
        buildIconFromDifficulty(category.difficulty),
      ],
    );
  }

  Icon buildIconFromDifficulty(int difficulty) {
    switch (difficulty) {
      case 1:
        {
          return Icon(
            FontAwesomeIcons.diceOne,
            color: Colors.black,
          );
        }
        break;

      case 2:
        {
          return Icon(
            FontAwesomeIcons.diceTwo,
            color: Colors.black,
          );
        }
        break;

      case 3:
        {
          return Icon(
            FontAwesomeIcons.diceThree,
            color: Colors.black,
          );
        }
        break;

      case 4:
        {
          return Icon(
            FontAwesomeIcons.diceFour,
            color: Colors.black,
          );
        }
        break;

      case 5:
        {
          return Icon(
            FontAwesomeIcons.diceFive,
            color: Colors.black,
          );
        }
        break;

      case 6:
        {
          return Icon(FontAwesomeIcons.diceSix, color: Colors.black);
        }
        break;

      default:
        {
          return Icon(
            FontAwesomeIcons.dice,
            color: Colors.black,
          );
        }
    }
  }

  refresh(String scaffoldMessage) {
    setState(() {});
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(scaffoldMessage)));
  }
}
