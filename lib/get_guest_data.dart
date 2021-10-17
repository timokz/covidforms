import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidreg/home.dart';
import 'package:flutter/material.dart';
import 'guest.dart';
import 'guest_data_source.dart';
import 'guest_document_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GetGuestData extends StatefulWidget {
  const GetGuestData({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GetGuestDataState();
}

class _GetGuestDataState extends State<GetGuestData> {
  @override
  Widget build(BuildContext context) {
    final guestRef = FirebaseFirestore.instance
        .collection('guests_testing')
        .withConverter<Guest>(
          fromFirestore: (snapshots, _) => Guest.fromJson(snapshots.data()!),
          toFirestore: (guest, _) => guest.toJson(),
        );

    void guestDataTimeCheck() {
      int cutoff = DateTime.now()
          .subtract(const Duration(days: 28))
          .toUtc()
          .millisecondsSinceEpoch;
      FirebaseFirestore.instance
          .collection('guests_testing')
          .where('entryTime', isGreaterThanOrEqualTo: cutoff)
          .get()
          .then((QuerySnapshot query) {
        for (DocumentSnapshot doc in query.docs) {
          Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
          DateTime dt = (map['entryTime'] ??= Timestamp.now()).toDate();
          print(dt.toString());
        }
      });
    }

    GuestDataSource gdc(List<Guest> guestList) {
      return GuestDataSource(guests: guestList);
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
          print("Guest Data Time Check: ");
          guestDataTimeCheck();
          final data = snapshot.requireData;

          List<Guest> guestList = [];
          for (var g in data.docs) {
            guestList.add(g.data() as Guest);
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
                                builder: (context) => const HomeScreen()));
                      })
                ],
              ),
              body: SfDataGrid(
                source: gdc(guestList),
                columnWidthMode: ColumnWidthMode.fill,
                allowSorting: true,
                allowMultiColumnSorting: true,
                columns: <GridColumn>[
                  GridColumn(
                      columnName: 'vName',
                      label: Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.centerLeft,
                        child: Text(AppLocalizations.of(context)!.firstName),
                      )),
                  GridColumn(
                      columnName: 'nName',
                      label: Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.centerLeft,
                          child: Text(AppLocalizations.of(context)!.lastName))),
                  GridColumn(
                      columnName: 'location',
                      label: Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.centerLeft,
                          child: Text(AppLocalizations.of(context)!.location))),
                  GridColumn(
                      columnName: 'entryTime',
                      label: Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.centerLeft,
                          child: Text(AppLocalizations.of(context)!.time))),
                ],
              )

              /* Padding(
                  padding: const EdgeInsets.all(64.0),
                  child: SizedBox(
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: data.size,
                          itemBuilder: (context, index) {
                            guestList.add(data.docs[index].data() as Guest);
                            return GuestItem(
                              data.docs[index].reference
                                  as DocumentReference<Guest>,
                              data.docs[index].data() as Guest,
                            );
                          })
                      ) // This trailing comma makes auto-formatting nicer for build methods.
                  ) */
              );
        });
  }
}

/*
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
        print("Guest Data Time Check: ");
        guestDataTimeCheck();
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
            body: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(rows: <DataRow>[
                    //   for (int i = 0; i < snapshot.data!.docs.length; i++)
                    //    buildDataRow(snapshot.data!.docs![i]),
                  ], columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Name',
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Location',
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Entry Time',
                      ),
                    ),
                  ]),
                )));
      },
    ); */