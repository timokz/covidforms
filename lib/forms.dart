import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'location_dropdown.dart';
import 'guest.dart';

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
        "https://tqwcovidreg-default-rtdb.europe-west1.firebasedatabase.app/" +
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
    return Center(
      child: Form(
        key: _form,
        child: Center(
          child: Column(
            children: [NameForm()],
          ),
        ),
      ),
    );
  }
}

class NameForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NameFormState();
}

class _NameFormState extends State<NameForm> {
  String v_name = "";
  String n_name = "";
  final vController = TextEditingController();
  final nController = TextEditingController();
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
      const SizedBox(
        height: 10,
      ),
      TextField(
        style: const TextStyle(
          fontFamily: 'Arial',
        ),
        decoration: const InputDecoration(
          hintText: "Vorname",
          prefixIcon: Icon(Icons.person),
        ),
        controller: vController,
      ),
      const SizedBox(
        height: 10,
      ),
      TextField(
        decoration: const InputDecoration(
            hintText: "Nachname", prefixIcon: Icon(Icons.person)),
        controller: nController,
      ),
      const SizedBox(
        height: 10,
      ),
      LocationDropdown(),
      const SizedBox(
        height: 10,
      ),
      const TextField(
          style: TextStyle(fontFamily: 'Arial'),
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(Icons.mail),
          )),
      const SizedBox(
        height: 10,
      ),
      TextButton(
        onPressed: () => {
          Guest(vController.text, nController.text),
        },
        child: const Text(
          "Add Guest",
          style: TextStyle(fontFamily: 'Arial'),
        ),
      ),
    ]);
  }
}
