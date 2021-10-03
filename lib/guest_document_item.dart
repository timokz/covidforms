import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidreg/home.dart';
import 'package:flutter/material.dart';
import 'guest.dart';
import 'package:intl/intl.dart';

class _GuestItem extends StatelessWidget {
  _GuestItem(this.guest, this.reference);

  final Guest guest;
  final DocumentReference<Guest> reference;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 4),
      child: Row(
        children: [
          Text("data"),
          Flexible(child: Text("text")),
        ],
      ),
    );
  }
}
