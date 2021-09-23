import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetGuestData extends StatefulWidget {
  const GetGuestData({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GetGuestDataState();
}

class _GetGuestDataState extends State<GetGuestData>{

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
          Text("testing displaying guest data" + doclist.length.toString()),
          if (doclist.isNotEmpty)
             Text("passt"),
          if (doclist.isEmpty)
            Text("ned gut "),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: doclist.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 50,
                  child: Center(child: Text(' Entry ${doclist[index]}')),
                );
              })
        ]);
      },
    );
  }
}