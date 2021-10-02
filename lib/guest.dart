import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Guest {
  final String vName;
  final String nName;
  final String email;
  final String location;
  final DateTime entryTime;
  CollectionReference guests =
      FirebaseFirestore.instance.collection('guests_testing');

  Guest(this.vName, this.nName, this.email, this.location, this.entryTime) {
    print("Constructed Guest with params: " +
        vName +
        "" +
        nName +
        "email: " +
        email +
        "location: " +
        location + "entry: "+ DateTime.now().toString());
    guests
        .add({
          'n_name': nName,
          'v_name': vName,
          'email': email,
          'location': location,
          'entryTime': entryTime
        })
        .then((value) => print("Guest Added"))
        .catchError((error) => print("Failed to add Guest: $error"));
  }
}
