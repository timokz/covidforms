
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(AppLocalizations.of(context)!.registered),
            )),
        body: Column(children: [
          const Center(
              child: Icon(
            Icons.check,
            size: 200,
          )),
          Center(
            child: Text(
                AppLocalizations.of(context)!.entry + ": " + formattedDate),
          )
        ]));
  }
}