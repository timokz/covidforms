import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

@immutable
class Guest {
  Guest(
      {required this.vName,
      required this.nName,
      required this.email,
      required this.location,
      required this.entryTime});

  Guest.fromParams(String vName, String nName, String email, String location,
      DateTime entryTime) {
    this.vName = vName;
    this.nName = nName;
    this.email = email;
    this.location = location;
    this.entryTime = entryTime;
  }

  Guest.fromJson(Map<String, Object?> json)
      : this(
          vName: json['v_name']! as String,
          nName: json['n_name']! as String,
          email: json['email']! as String,
          location: json['location']! as String,
          entryTime: (json['entryTime']! as Timestamp).toDate(),
        );

  late final String vName;
  late final String nName;
  late final String email;
  late final String location;
  late final DateTime entryTime;

  final CollectionReference guests =
      FirebaseFirestore.instance.collection('guests_testing');

  void addToDB() {
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

  Map<String, Object?> toJson() {
    return {
      'n_name': nName,
      'v_name': vName,
      'email': email,
      'location': location,
      'entryTime': entryTime
    };
  }
}