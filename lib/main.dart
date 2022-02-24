import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Demo Application',
      theme: ThemeData( primarySwatch: Colors.blue,),
      home: MyHomePage(title: 'Home page'),
    );
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
// user defined function
  void _showDialog(BuildContext context) {
// user defined function void _showDialog(BuildContext context) {
// flutter defined function
    showDialog(
      context: context, builder: (BuildContext context) {
// return object of type Dialog
      return AlertDialog(
        title: new Text("Message"),
        content: new Text("Hello World from Viet Nam !!"),
        actions: <Widget>[
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title),),
      body: Center(
          child: GestureDetector(
              onTap: () {
                _showDialog(context);
              },
              child: Text( 'Hello World', )
          )
      ),
    );
  }
}