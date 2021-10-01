import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';
import 'home.dart';

class Imprint extends StatefulWidget {
  const Imprint({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImprintState();
}

class _ImprintState extends State<Imprint> {


  @override
  Widget build(BuildContext context) {
    var _url = "https://tqw.at/hausordnung/";
    void _launchURL() async => await canLaunch(_url)
        ? await launch(_url)
        : throw 'Could not connect to $_url';
    return Container(
      child: TextButton(
        onPressed: () { _launchURL(); },
        child: Text("TQW IMPRINT"),


      ),
    );
  }
}