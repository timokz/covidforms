import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'forms.dart';
import 'home.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'dart:async';
//import 'package:firebase_database/firebase_database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;
  Future<void> initializeDefault() async {
    FirebaseApp app = await Firebase.initializeApp();
    assert(app != null);
    print('Initialized default app $app');
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
      print("error establishing connection");
      return const Text("fuck");
    }

    //    FirebaseAppCheck.instance.activate(webRecaptchaSiteKey: '44f2dace-e0b0-41cf-b3c3-fec89fb90f5e');
    return MaterialApp(
        title: 'tqwcovidreg',
        theme: ThemeData(

          primaryColor: Colors.black,
          backgroundColor: const Color(0xffffffff),
      //    fontFamily: 'Freya',


        ),
        home: const HomeScreen());
  }
}

/*
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(TQW());
}

class TQW extends StatelessWidget{
    TQW({Key? key}) : super(key: key);

    final Future<FirebaseApp> _initFB =  Firebase.initializeApp();

    @override
  Widget build(BuildContext context) {
      print("in builder");
    return FutureBuilder(
      future: _initFB,
      builder: (context, snapshot) {
         FirebaseAppCheck.instance.activate(webRecaptchaSiteKey: 'T3q2w1Wien');

        if (snapshot.hasError) {
          print("made it to snapshot error ");

          return const SnackBar(content: Text("Database Connection failed to establish. Please try again."));
        }
// Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print("made it to pos connection ");

          return const HomeScreen();/*MaterialApp(
              localizationsDelegates:  const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''), // English, no country code
                Locale('de', ''), // German, no country code
              ],
              theme: ThemeData(
                  primaryColor: Colors.amber
              ),
              home: const HomeScreen()
          ); */
        }
// Otherwise, show something whilst waiting for initialization to complete
        return const CircularProgressIndicator(backgroundColor: Color(0x0000000c), value: 12,);
      },
    );
  }
}
*/
