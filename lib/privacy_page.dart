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
        body: Column(children: const [
          Center(
            child:
                Text(""""
 
                Datenschutzrechtliche Information nach Art. 13 DSGVO:
                Zweck und Rechtsgrundlagen der Verarbeitung:
                Zweck: Contact Tracing zur Verhinderung der (Weiter)Verbreitung von COVID-19 im Fall des Auftretens eines Verdachtsfalles von COVID-19 Rechtsgrundlagen: Art. 6 Abs. 1 lit. d DSGVO (Verarbeitung personenbezogener Daten zum Schutz lebenswichtiger Interessen der betroffenen Person
                oder einer anderen natürlichen Person). § 5 Abs. 3 Epidemiegesetz 1950, BGBl. Nr. 186/1950 idF
                BGBl. I Nr. 103/2020 Verordnung des Magistrats der Stadt Wien betreffend Auskunftserteilung für
                Contact Tracing im Zusammenhang mit Verdachtsfällen von COVID-19*
                
                Bei der Registrierung erfasste Daten:

                  Name, Vorname
                  Ort,
                  Telefon-NR,
                  Email,
                  Zeit der Registrierung
  
                  Diese Daten werden nur im Fall einer positiv-gesteten Person, oder eines Verdachtsfalls an das Gesundheitsamt weitergeleitet und nicht mit Dritten geteilt.
                  Es werden keine zusätzlichen Meta-Daten gespeichtert.
                
                Verantwortlicher für die Verarbeitung der erhobenen personenbezogenen Daten
                  Tanzquartier Wien
                  
                Datenschutzbeauftragte
                    Monika Gruber 
                  
                Die verarbeiteten personenbezogenen Daten werden zu folgendem Zweck an folgende Empfänger 
                weitergeleitet:
                Zweck: Contact Tracing zur Verhinderung der (Weiter-)Verbreitung von COVID-19 im Fall des
                Auftretens eines Verdachtsfalles von COVID-19 Empfänger: die Daten sind auf Verlangen der MA
                15-Gesundheitsdienst der Stadt Wien an diese weiterzuleiten.
                
                
                
                Ihre personenbezogenen Daten werden gem. § 2 der Verordnung des Magistrats der Stadt Wien
                betreffend Auskunftserteilung für Contact Tracing im Zusammenhang mit Verdachtsfällen von
                COVID-19 4 Wochen nach ihrer Aufnahme gelöscht.
                Betroffenenrechte: Als betroffene Person haben Sie das Recht auf Auskunft über die Sie betreffenden personenbezogenen Daten sowie auf Berichtigung, Löschung oder Einschränkung der
                Verarbeitung oder auf Widerspruch gegen die Verarbeitung.
                Wenn die Verarbeitung auf einer Einwilligung im Sinne des Art. 6 Abs. 1 lit. a oder Art. 9 Abs. 2 lit.
                a DSGVO beruht, haben Sie das Recht, Ihre Einwilligung jederzeit zu widerrufen. Wir weisen aber
                darauf hin, dass die Verarbeitung aufgrund der Einwilligung bis zum Widerruf rechtmäßig war.
                Wenn Sie der Auffassung sind, dass Ihren Rechten nicht oder nicht ausreichend nachgekommen
                wird, haben Sie die Möglichkeit einer Beschwerde bei der Österreichischen Datenschutzbehörde:
                Barichgasse 40-42, 1030 Wien, E-Mail: dsb@dsb.gv.at
                """),
          )
        ]));
  }
}

/*Datenschutzrechtliche Information nach Art. 13 DSGVO:
Zweck und Rechtsgrundlagen der Verarbeitung:
Zweck: Contact Tracing zur Verhinderung der (Weiter)Verbreitung von COVID-19 im Fall des Auftretens eines Verdachtsfalles von COVID-19 Rechtsgrundlagen: Art. 6 Abs. 1 lit. d DSGVO (Verarbeitung personenbezogener Daten zum Schutz lebenswichtiger Interessen der betroffenen Person
oder einer anderen natürlichen Person). § 5 Abs. 3 Epidemiegesetz 1950, BGBl. Nr. 186/1950 idF
BGBl. I Nr. 103/2020 Verordnung des Magistrats der Stadt Wien betreffend Auskunftserteilung für
Contact Tracing im Zusammenhang mit Verdachtsfällen von COVID-19*/

/*Bei der Registrierung erfasste Daten:

Name, Vorname
Ort,
Telefon-NR,
Email,
Zeit der Registration

Diese Daten werden nur im Fall einer positiv-gesteten Person, oder eines Verdachtsfalls an das Gesundheitsamt weitergeleitet und nicht mit Dritten geteilt.
Es werden keine zusätzlichen Meta-Daten gespeichtert.
 */

/*Verantwortlicher für die Verarbeitung der erhobenen personenbezogenen Daten
  Tanzquartier Wien

  Datenschutzbeauftragte
    Monika Gruber */

/*Die verarbeiteten personenbezogenen Daten werden zu folgendem Zweck an folgende Empfänger weitergeleitet:
Zweck: Contact Tracing zur Verhinderung der (Weiter-)Verbreitung von COVID-19 im Fall des
Auftretens eines Verdachtsfalles von COVID-19 Empfänger: die Daten sind auf Verlangen der MA
15-Gesundheitsdienst der Stadt Wien an diese weiterzuleiten.*/

/*Hinweise
Ihre personenbezogenen Daten werden gem. § 2 der Verordnung des Magistrats der Stadt Wien
betreffend Auskunftserteilung für Contact Tracing im Zusammenhang mit Verdachtsfällen von
COVID-19 4 Wochen nach ihrer Aufnahme gelöscht.
Betroffenenrechte: Als betroffene Person haben Sie das Recht auf Auskunft über die Sie betreffenden personenbezogenen Daten sowie auf Berichtigung, Löschung oder Einschränkung der
Verarbeitung oder auf Widerspruch gegen die Verarbeitung.
Wenn die Verarbeitung auf einer Einwilligung im Sinne des Art. 6 Abs. 1 lit. a oder Art. 9 Abs. 2 lit.
a DSGVO beruht, haben Sie das Recht, Ihre Einwilligung jederzeit zu widerrufen. Wir weisen aber
darauf hin, dass die Verarbeitung aufgrund der Einwilligung bis zum Widerruf rechtmäßig war.
Wenn Sie der Auffassung sind, dass Ihren Rechten nicht oder nicht ausreichend nachgekommen
wird, haben Sie die Möglichkeit einer Beschwerde bei der Österreichischen Datenschutzbehörde:
Barichgasse 40-42, 1030 Wien, E-Mail: dsb@dsb.gv.at*/