import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const String _url = 'https://flutter.dev';

void main() => runApp(
  const MaterialApp(
    home: Material(
      child: Center(
        child: RaisedButton(
          onPressed: _launchURL,
          child: Text('Show Flutter homepage'),
        ),
      ),
    ),
  ),
);

void _launchURL() async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}