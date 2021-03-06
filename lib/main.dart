import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';
import 'home.dart';
import 'dart:async';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
var logger = Logger(
  printer: PrettyPrinter(),
);
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) async {
    _AppState? state = context.findAncestorStateOfType<_AppState>();
    state!.changeLanguage(newLocale);
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;
  Locale _locale = const Locale("en");

  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp();
    logger.i('Initialized default app $app');
  }

  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      logger.e("error establishing connection");
      return const Text("No Connection established");
    }
    //TODO AppCheck
      //FirebaseAppCheck.instance.activate(webRecaptchaSiteKey: '6LfmSaQcAAAAAIONnq9PoTTXA4DJ9T9z_Dpsbi4E');
    return MaterialApp(
        title: 'tqwcovidreg',
        theme: ThemeData(
          primaryColor: Colors.black,
          backgroundColor: const Color(0xffffffff),
          fontFamily: 'Roboto',
        ),
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('de', ''), // German, no country code
        ],
        locale: _locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        home: const HomeScreen());
  }
}