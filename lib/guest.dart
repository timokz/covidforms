import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Guest extends StatelessWidget {
  final String v_name;
  final String n_name;

  Guest(this.v_name, this.n_name);
  CollectionReference guests = FirebaseFirestore.instance.collection('guests_testing');

  Future<void> addGuest() {
    print(this.v_name); //Wtf==
    return guests
        .add({
      'n_name': n_name,
      'v_name' : v_name
    })
        .then((value) => print("Guest Added"))
        .catchError((error) => print("Failed to add Guest: $error"));
  }
  @override
  Widget build(BuildContext context) {

    return TextButton(
      onPressed: addGuest,
      child: Text(
        "Add Guest",
      ),
    );
  }
}