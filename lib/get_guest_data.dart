import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidreg/home.dart';
import 'package:flutter/material.dart';

class GetGuestData extends StatefulWidget {
  const GetGuestData({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GetGuestDataState();
}

class _GetGuestDataState extends State<GetGuestData> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _guests =
        FirebaseFirestore.instance.collection('guests_testing').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _guests,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Snapshot returned with Error');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return Scaffold(
            backgroundColor: const Color(0xffffffff),
            appBar: AppBar(
              title: const Text("TQW Guest Data"),
              backgroundColor: Colors.black,
              actions: <Widget>[
                IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    })
              ],
            ),
            body: Padding(
                padding: const EdgeInsets.all(64.0),
                child: ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return ListTile(
                      title: Text(data['n_name']),
                      subtitle: Text(data['v_name']),
                    );
                  }).toList(),
                )) // This trailing comma makes auto-formatting nicer for build methods.
            );
      },
    );
  }
}
