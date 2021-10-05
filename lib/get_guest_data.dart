import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidreg/home.dart';
import 'package:flutter/material.dart';
import 'guest.dart';
import 'package:intl/intl.dart';

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

    final guestRef = FirebaseFirestore.instance
        .collection('guests_testing')
        .withConverter<Guest>(
          fromFirestore: (snapshots, _) => fromJson(snapshots.data()!),
          toFirestore: (guest, _) => guest.toJson(),
        );

    bool guestDataTimeCheck(var guestRef) {
      var cutoff = DateTime.now();
      var guests = FirebaseFirestore.instance.collection('guests_testing');

      return true;
    }

    return StreamBuilder<QuerySnapshot<Guest>>(
      stream: guestRef.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        final data = snapshot.requireData;

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
                              builder: (context) => const HomeScreen()));
                    })
              ],
            ),
            body: Padding(
                padding: const EdgeInsets.all(64.0),
                child: SizedBox(
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return const ListTile();
                        })
                    /*   child: DataTable(columns: const [
                      DataColumn(label: Text("Name")),
                      DataColumn(label: Text("Location")),
                      DataColumn(label: Text("eMail")),
                      DataColumn(label: Text("Entry")),
                    ],
                        rows: List<DataRow>.generate(
                      data.size,
                            (int index) = > DataRow(
                            cells:
                        )
                    )[
                    ])) */

                    ) // This trailing comma makes auto-formatting nicer for build methods.
                ));
      },
    );
  }
}
