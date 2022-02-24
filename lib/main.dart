import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Demo Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyButton(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title),),
      body: Center( child: Icon(Icons.email)),
    );
  }
}

class MyButton extends StatelessWidget {
  MyButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.red),
          left: BorderSide(width: 1.0, color: Colors.red),
          right: BorderSide(width: 1.0, color: Colors.red),
          bottom: BorderSide(width: 1.0, color: Colors.red),
        ),
      ),
      child: Container(
        padding: const
        EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.red),
            left: BorderSide(width: 1.0, color: Colors.red),
            right: BorderSide(width: 1.0, color: Colors.red),
            bottom: BorderSide(width: 1.0, color: Colors.red),
          ),
          color: Colors.white,
        ),
        child: Center(
          child: const Text('Button demo', style: TextStyle(color: Colors.black)),
      ),
      ),
    );
  }
}