import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetGuestData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('guests_testing');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc().get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        List<String> doclist = [];
        FirebaseFirestore.instance
            .collection('guests_testing')
            .get()
            .then((QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            print(doc.data());
            doclist.add(doc.data().toString());
          }
        });
        return Column(children: [

          ListView.builder(
              itemCount: doclist.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 50,
                  child: Center(child: Text(doclist[index])),
                );
              })
        ]);
      },
    );
  }
}
/*
class _GuestItem extends StatelessWidget{

  final String documentId;

  _GuestItem(this.documentId);

  Widget get data {
    return SizedBox(
      width: 100,
      child: Center(
        child: I
      ),
    );

}

  @override
  Widget build(BuildContext context) {
    CollectionReference guests = FirebaseFirestore.instance.collection('guests_testing');

    return FutureBuilder<DocumentSnapshot>(
      future: guests.doc(documentId).get(),
        builder:
        (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        }
    )

  } */
