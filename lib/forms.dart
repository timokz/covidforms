import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'entry_screen.dart';
import 'location_dropdown.dart';
import 'guest.dart';
import 'email_form.dart';

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
      print(response);
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
  CollectionReference guests =
      FirebaseFirestore.instance.collection('guests_testing');

  @override
  void dispose() {
    vController.dispose();
    nController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //TODO actually have to wrap this in Shortcuts() Widget
      const SizedBox(
        height: 10,
      ),
      TextField(
        style: const TextStyle(
          fontFamily: 'Arial',
        ),
        decoration: const InputDecoration(
          hintText: "First name",
          prefixIcon: Icon(Icons.person),
        ),
        controller: vController,
      ),
      const SizedBox(
        height: 10,
      ),
      TextField(
        decoration: const InputDecoration(
            hintText: "Last name", prefixIcon: Icon(Icons.person)),
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
          decoration: const InputDecoration(
              labelText: 'Telephone*',
              hintText: "+43 660 3111499",
              prefixIcon: Icon(Icons.phone)),
          keyboardType: TextInputType.phone,
          validator: (String? value) {
            String sanitizedVal = value!.trim();
            if (sanitizedVal.isEmpty) {
              return 'Value required';
            }
            return null;
          },
          onChanged: (String str) {
            setState(() {});
          }),
      const SizedBox(
        height: 10,
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
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
          if (vController.text.isNotEmpty && nController.text.isNotEmpty)
            {
              Guest(vController.text, nController.text, guestEmail,
                      guestLocation, DateTime.now())
                  .addToDB(),
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EntryScreen())),
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data'))),
            }
          else
            {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter valid Data ')))
            }
        },
        child: const Text(
          "Register",
          style: TextStyle(fontFamily: 'Arial'),
        ),
      )
    ]);
  }
}
