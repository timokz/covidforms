import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'guest.dart';
import 'package:intl/intl.dart';

class GuestItem extends StatelessWidget {
  const GuestItem(this.reference, this.guest);

  final DocumentReference<Guest> reference;
  final Guest guest;

  void nullCheck(){
    print("not null yet");
  }
  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('yyyy-MM-dd – kk:mm').format(guest.entryTime);

    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 4),
      child: Row(
        children: [

          Flexible(child: Text(guest.vName + " " + guest.nName)),
          Flexible(child: Text(guest.location + " " + formattedDate)),
        ],
      )
    );
  }
}