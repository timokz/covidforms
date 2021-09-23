import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetGuestData extends StatefulWidget {
  const GetGuestData({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GetGuestDataState();
}

class _GetGuestDataState extends State<GetGuestData> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('guests_testing');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc().get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {
            return const Text('no data');
          } else {
            FirebaseFirestore.instance
                .collection('guests_testing')
                .get()
                .then((QuerySnapshot querySnapshot) {
              for (var doc in querySnapshot.docs) {
                print(doc.data());
              }
            });
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                String key = data.keys.elementAt(index);
                return  Column(
                  children: <Widget>[
                     ListTile(
                      title:  Text("$key"),
                      subtitle:  Text("${data[key]}"),
                    ),
                     const Divider(
                      height: 2.0,
                    ),
                  ],
                );
              },
            );
            return Column(children: [
              Text("testing displaying guest data"),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10,
                      child: Center(child: Text(' Entry ${data[index]}')),
                    );
                  })
            ]);
          }
        } else {
          return Text('Error'); // error
        }

      },
    );
  }
}
