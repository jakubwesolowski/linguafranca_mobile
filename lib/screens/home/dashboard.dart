import 'package:flutter/material.dart';
import 'package:rtimly/screens/home/list_of_words_page.dart';

class DashboardView extends StatefulWidget {
  final Function(Widget widget) setParentWidget;

  DashboardView({Key key, @required this.setParentWidget}) : super(key: key);

  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RaisedButton(
              key: Key('listOfWords'),
              color: Theme.of(context).buttonColor,
              child: Text('List of words', style: TextStyle(fontSize: 20.0)),
//              onPressed: () => {widget.setParentWidget(ListOfWordsView())},
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListOfWordsView()))
                  },
            ),
            RaisedButton(
              key: Key('newWords'),
              color: Theme.of(context).buttonColor,
              child: Text('New words', style: TextStyle(fontSize: 20.0)),
              onPressed: () => {},
            ),
            RaisedButton(
              key: Key('testOneOfFour'),
              color: Theme.of(context).buttonColor,
              child: Text('Test - choose 1 of 4',
                  style: TextStyle(fontSize: 20.0)),
              onPressed: () => {},
            ),
            RaisedButton(
              key: Key('testWriteWord'),
              color: Theme.of(context).buttonColor,
              child:
                  Text('Test - write word', style: TextStyle(fontSize: 20.0)),
              onPressed: () => {},
            ),
            RaisedButton(
              key: Key('showFlashCards'),
              color: Theme.of(context).buttonColor,
              child: Text('Show flash cards', style: TextStyle(fontSize: 20.0)),
              onPressed: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
