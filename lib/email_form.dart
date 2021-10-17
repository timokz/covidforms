import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class EmailForm extends StatefulWidget {
  final ValueChanged<String> onEmailChanged;
  const EmailForm({Key? key, required this.onEmailChanged}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final eController = TextEditingController();
  String guestEmail = "";
  @override
  void dispose() {
    eController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: TextFormField(
            validator: (String? value) {
              return (!value!.contains('@') &&
                      value.isNotEmpty &&
                      EmailValidator.validate(value))
                  ? 'Incorrect format.'
                  : null;
            },
            autovalidateMode: AutovalidateMode.always,
            keyboardType: TextInputType.emailAddress,
            controller: eController,
            onChanged: (String arg) {
              widget.onEmailChanged(arg);
            },
            style: const TextStyle(fontFamily: 'Arial'),
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "office@tqw.at",
              prefixIcon: Icon(Icons.mail),
            )),
      ),
    );
  }
}

/*
By registering, you agree with our House Rules <href>

4.3. Online-Formulare

Wir verwenden ein Online-Formular zur raschen Kontaktaufnahme sowie für Akkreditierungen. Wenn Sie ein Online-Formular absenden, speichern wir Vorname, Nachname, Adresse und E-Mailadresse (bei Akkreditierungen zusätzlich Beruf, Firma, Telefonnummer) sowie Datum und Uhrzeit des Absendens.

Die erhobenen Daten werden ausschließlich für die Bereitstellung der angefragten Services verwendet und nicht an Dritte weiter gegeben. Die Zustimmung zur Nutzung dieser Daten kann jederzeit widerrufen werden.


10. Recht auf Auskunft, Berichtigung, Löschung oder Einschränkung der Verarbeitung Ihrer gespeicherten Daten

Sie haben gegenüber dem TQW

* das Recht auf Auskunft, Berichtigung, Löschung oder Einschränkung der Verarbeitung Ihrer gespeicherten Daten

* ein Widerspruchsrecht gegen die Verarbeitung

* ein Recht auf Datenübertragbarkeit gemäß den Voraussetzungen des Datenschutzrechts

Bitte senden Sie Ihr Ersuchen an datenschutz@tqw.at.

Die Grenze der Auskunfts- Berichtigungs- und Löschungspflichten ergibt sich aus den Zwecken der Vertragserfüllung, inkl Zahlungsansprüchen und unseren gesetzlichen Verschwiegenheits- und Dokumentations- oder Aufbewahrungspflichten und Erfordernissen der Rechtsdurchsetzung.

Beschwerden können Sie an die Österreichische Datenschutzbehörde www.dsb.gv.at richten.
 */