import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'forms.dart';
import 'get_guest_data.dart';
import 'imprint.dart';
import 'main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'privacy_page.dart';
import 'guest_data_check.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//TODO QUERY SCREENSIZE AND ALLOCATE PERCENTAGE

class _HomeScreenState extends State<HomeScreen> {
  bool langEn = true;

  @override
  Widget build(BuildContext context) {
    const _url = 'https://tqw.at';
    void _launchURL() async => await canLaunch(_url)
        ? await launch(_url)
        : throw 'Could not connect to $_url';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        title: TextButton(
            style: const ButtonStyle(),
            onPressed: _launchURL,
            child: Text(
              AppLocalizations.of(context)!.home_title,
              //  Text("TQW Covid Form",
              style: const TextStyle(
                decorationColor: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto",
                //    fontStyle: FontStyle.italic,
              ),
            )),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              String lang = "";
              if (langEn) {
                lang = 'de';
                langEn = false;
              } else {
                lang = 'en';
                langEn = true;
              }
              Locale newLocale = Locale(lang, '');

              App.setLocale(context, newLocale);
            },
            icon: const Icon(Icons.g_translate),
          ),
          IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GetGuestData()));
              })
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(32.0),
    //      padding: const EdgeInsets.fromLTRB(32.0,32.0,32.0,0),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: _launchURL, // handle your image tap here
                      child: const Image(
                        image: AssetImage('graphics/tqwlogo.jfif'),
                      ))),
              const Center(child: FaB()),
              const SizedBox(
                height: 20,
              ),
              const Imprint(),
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Privacy()));
                    },
                    child: const Text("Datenschutz")),
              ),
              Text(AppLocalizations.of(context)!.dsgvo)
              //imprint
              //    Center(child:),
            ],
          )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}