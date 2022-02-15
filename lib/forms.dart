import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'entry_screen.dart';
import 'location_dropdown.dart';
import 'guest.dart';
import 'email_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);
class FaB extends StatefulWidget {
  const FaB({Key? key}) : super(key: key);

  @override
  _FaBState createState() {
    return _FaBState();
  }
}

class _FaBState extends State<FaB> {
  final _form = GlobalKey<FormState>();
  String title = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void writeData() async {
    _form.currentState!.save();

    var url =
        "https://tqwcovidreg-default-rtdb.europe-west1.firebasedatabase.app/"
        "data.json";
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({"title": title}),
      );
      logger.i(response);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const NameForm();
  }
}

class NameForm extends StatefulWidget {
  const NameForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NameFormState();
}

class _NameFormState extends State<NameForm> {
  String vName = "";
  String nName = "";
  String guestEmail = "";
  String guestLocation = "";
  final vController = TextEditingController();
  final nController = TextEditingController();
  final pController = TextEditingController();
  bool isChecked = false;
  String initialCountry = 'AT';
  PhoneNumber number = PhoneNumber(isoCode: 'AT');

  CollectionReference guests = FirebaseFirestore.instance.collection('guests');

  @override
  void dispose() {
    vController.dispose();
    nController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        TextField(
          style: const TextStyle(
            fontFamily: 'Arial',
          ),
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.firstName,
            prefixIcon: const Icon(Icons.person),
          ),
          controller: vController,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.lastName,
              prefixIcon: const Icon(Icons.person)),
          controller: nController,
        ),
        const SizedBox(
          height: 10,
        ),
        LocationDropdown(
          onChanged: (newLocation) {
            guestLocation = newLocation;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        EmailForm(
          onEmailChanged: (newEmail) {
            guestEmail = newEmail;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
            decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.telephone,
                prefixIcon: const Icon(Icons.phone)),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            controller: pController,
            inputFormatters: [FilteringTextInputFormatter.deny(RegExp("[.]"))],
            onEditingComplete: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            validator: (value) {
              if (value!.isEmpty ||
                  !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                      .hasMatch(value)) {
                //  r'^[0-9]{10}$' pattern plain match number with length 10
                return AppLocalizations.of(context)!.phone_check;
              } else {
                return null;
              }
            },
            onChanged: (String str) {
              setState(() {});
            }),
        const SizedBox(
          height: 10,
        ),
        FormField<bool>(
          builder: (state) {
            return Row(
              children: <Widget>[
                Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
//save checkbox value to variable that store terms and notify form that state changed
                        isChecked = value!;
                        state.didChange(value);
                      });
                    }),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      AppLocalizations.of(context)!.terms,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Text(
                  state.errorText ?? '',
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                  ),
                )
              ],
            );
//display error in matching theme
          },
        ),
        Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                primary: Colors.black,
                shadowColor: Colors.white,
                elevation: 5,
                minimumSize: (const Size(150, 50)),
                enableFeedback: true,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => {
                if (vController.text.isEmpty || nController.text.isEmpty)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text(AppLocalizations.of(context)!.name_check))),
                  }
                else if ((guestEmail.isEmpty ||
                        guestEmail.toString().length < 4) ||
                    !guestEmail.toString().contains("@") ||
                    !guestEmail.toString().contains("."))
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text(AppLocalizations.of(context)!.email_check))),
                  }
                else if (pController.text.isEmpty ||
                    pController.text.length < 8)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text(AppLocalizations.of(context)!.phone_check))),
                  }
                else if (vController.text.isNotEmpty &&
                    nController.text.isNotEmpty &&
                    isChecked)
                  {
                    Guest.fromParams(
                            vController.text,
                            nController.text,
                            guestEmail,
                            guestLocation,
                            DateTime.now(),
                            pController.text)
                        .addToDB(),
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EntryScreen())),
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text(AppLocalizations.of(context)!.entered_data))),
                  }
                else if (isChecked == false)
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text(AppLocalizations.of(context)!.terms_check))),
                  }
                else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text(AppLocalizations.of(context)!.invalid_data))),
                  }
              },
              child: Text(
                AppLocalizations.of(context)!.register,
                style: const TextStyle(
                    fontFamily: 'Roboto', fontStyle: FontStyle.italic),
              ),
            ))
      ],
    );
  }
}