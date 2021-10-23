import 'guest.dart';

class GuestCheck {
  static String location = "Studio 1";
  static int vName = 0;
  static int nName = 0;

  void addGuestChecks() {
    List<Guest> guestCheckList = List.empty(growable: true);
  int duration = 28;
    for (int x = 0; x < 55; ++x) {
      print("Position in check queue: " + x.toString());
      var date = DateTime.now().subtract(Duration(days: duration++));
      guestCheckList.add(Guest.fromParams(vName.toString(), nName.toString(),
          "email@test.com", location, date, "number"));
      ++vName;
      ++nName;
    }

    for (Guest g in guestCheckList) {
      g.addToDB();
    }
  }
}