import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Imprint extends StatefulWidget {
  const Imprint({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ImprintState();
}

class _ImprintState extends State<Imprint> {
  @override
  Widget build(BuildContext context) {
    var _url = AppLocalizations.of(context)!.h_url;
    void _launchURL() async => await canLaunch(_url)
        ? await launch(_url)
        : throw 'Could not connect to $_url';
    return TextButton(
      onPressed: () {
        _launchURL();
      },
      child: Text("TQW " + AppLocalizations.of(context)!.imprint),
    );
  }
}