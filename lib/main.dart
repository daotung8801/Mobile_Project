import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'generated/intl/messages_all.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localizations Sample App',
      theme: ThemeData(primarySwatch: Colors.blue),
      localizationsDelegates: [
        CustomLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
        const Locale('vi', ''),
      ],
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CustomLocalizations.of(context)!.title),
      ),
      body: Center(
        child: Text(
          CustomLocalizations.of(context)!.message,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}

class CustomLocalizations {
  static Future<CustomLocalizations> load(Locale locale) {
    final String name =
    locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return CustomLocalizations();
    });
  }

  static CustomLocalizations? of(BuildContext context) {
    return Localizations.of<CustomLocalizations>(context, CustomLocalizations);
  }

  String get title {
    return Intl.message(
      'Lesson 19',
      name: 'title',
      desc: 'Title for the Lesson19 application',
    );
  }

  String get message {
    return Intl.message(
      'Hello World',
      name: 'message',
      desc: 'Message for the Lesson19 application',
    );
  }
}

class CustomLocalizationsDelegate
    extends LocalizationsDelegate<CustomLocalizations> {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<CustomLocalizations> load(Locale locale) {
    return CustomLocalizations.load(locale);
  }

  @override
  bool shouldReload(CustomLocalizationsDelegate old) => false;
}
