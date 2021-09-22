import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Guest extends StatelessWidget {
  final String v_name;
  final String n_name;

   Guest(this.v_name, this.n_name);


  @override
  Widget build(BuildContext context) {
    CollectionReference guests = FirebaseFirestore.instance.collection('guests_testing');
    Future<void> addGuest() {
      print(this.v_name);
      return guests
          .add({
        'n_name': n_name,
        'v_name' : v_name
      })
          .then((value) => print("Guest Added"))
          .catchError((error) => print("Failed to add Guest: $error"));
    }
    return TextButton(
      onPressed: addGuest,
      child: const Text(
        "Add Guest",
      ),
    );
  }
}