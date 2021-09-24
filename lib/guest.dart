import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Guest  {
  final String v_name;
  final String n_name;
  CollectionReference guests =
      FirebaseFirestore.instance.collection('guests_testing');

  Guest(this.v_name, this.n_name) {
    print("Constructed Guest with params: " + v_name + "" + n_name);
    guests
        .add({'n_name': n_name, 'v_name': v_name})
        .then((value) => print("Guest Added"))
        .catchError((error) => print("Failed to add Guest: $error"));
  }

}
