import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    var _url = AppLocalizations.of(context)!.h_url;
    void _launchURL() async => await canLaunch(_url)
        ? await launch(_url)
        : throw 'Could not connect to $_url';

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "",
                ))),
        body: SingleChildScrollView(
            child: Column(children: const [
          Center(
            child: Text(""""
 Datenschutzrechtliche Information nach Art. 13 DSGVO:

Zweck und Rechtsgrundlagen der Verarbeitung:
Contact Tracing zur Verhinderung der (Weiter-)Verbreitung von COVID-19 im Fall des Auftretens eines Verdachtsfalles von COVID-19 
Rechtsgrundlagen: Art 6 Abs. 1 lit c) DSGVO (Verarbeitung personenbezogener Daten aufgrund gesetzlicher Verpflichtungen gemäß § 5c Epidemiegesetz 1950 idgF. i.V.m. § 17 Abs. 1 der 2. COVID-19-Maßnahmenverordnung idgF).

Bei der Registrierung erfasste Daten:
Name, Vorname 
Datum, Ort und Uhrzeit von Beginn und Ende des Aufenthalts im TQW
Telefon-Nr. und Email, soweit vorhanden

Diese Daten werden nur zum Zweck der Kontaktpersonennachverfolgung verarbeitet und der Bezirksverwaltungsbehörde im Umfang ihres Verlangens weitergeleitet.
Es werden keine zusätzlichen Meta-Daten gespeichert. Die Daten sind für die Dauer von 28 Tagen ab dem Veranstaltungstag aufzubewahren und werden danach unverzüglich gelöscht.

Verantwortlicher für die Verarbeitung der erhobenen personenbezogenen Daten
Tanzquartier Wien GmbH
Datenschutzbeauftragte 
Ela Piplits

Wenn Sie der Auffassung sind, dass Ihren Rechten nicht oder der nicht ausreichend nachgekommen wird, haben Sie die Möglichkeit einer Beschwerde bei der Österreichischen Datenschutzbehörde: Barichgasse 40-42., 1030 Wien, E-Mail: dsb@dsb.gv.at

                """),
          )
        ])));
  }
}
