import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
            children: [
              NameForm()
            ],
          ),
        ),
      ),
    );
  }
}

class NameForm extends StatelessWidget {
  String v_name = "";
  String n_name = "";

  NameForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        decoration: const InputDecoration(hintText: "Vorname"),
        onSaved: (value) {
          v_name = value!;
        },
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        decoration: const InputDecoration(hintText: "Nachname"),
        onSaved: (value) {
          n_name = value!;
        },
      ),
      const SizedBox(
        height: 10,
      ),
      Guest(v_name, n_name),
    ]);
  }
}
