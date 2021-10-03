import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'forms.dart';
import 'get_guest_data.dart';
import 'imprint.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    const _url = 'https://tqw.at';
    void _launchURL() async => await canLaunch(_url)
        ? await launch(_url)
        : throw 'Could not connect to $_url';
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          title: TextButton(
              style: const ButtonStyle(),
              onPressed: _launchURL,
              child: const Text(
                "TQW Covid Form",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.italic,
                ),
              )),
          backgroundColor: Colors.black,
          actions: <Widget>[
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
          padding: const EdgeInsets.all(64.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: _launchURL, // handle your image tap here
                      child: const Image(
                        image: AssetImage('graphics/tqwlogo.jfif'),
                      ))),
              const Expanded(child: Center(child: FaB())),
              const Center(
                child:
                    Align(alignment: Alignment.bottomCenter, child: Imprint()),
              )
              //imprint
              //    Center(child:),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
