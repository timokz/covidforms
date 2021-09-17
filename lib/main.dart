 import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'forms.dart';
import 'home.dart';
import 'package:firebase_app_check/firebase_app_check.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(webRecaptchaSiteKey: 'recaptcha-v3-site-key');
  runApp(TQW());
}

class TQW extends StatelessWidget{
    TQW({Key? key}) : super(key: key);

   final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
// Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const SnackBar(content: Text("Database Connection failed to establish. Please try again."));
        }

// Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
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
          );
        }

// Otherwise, show something whilst waiting for initialization to complete
        return const CircularProgressIndicator(backgroundColor: Color(0x0000000c), value: 12,);
      },
    );
  }
}


/*

return  MaterialApp(
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