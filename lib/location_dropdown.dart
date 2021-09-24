import 'package:flutter/material.dart';
import 'forms.dart';
import 'get_guest_data.dart';

class LocationDropdown extends StatefulWidget {
  late final ValueChanged<String> onChanged;

  LocationDropdown({Key? key}) : super(key: key);

  @override
  State<LocationDropdown> createState() => _LocationDropdownState();
}

class _LocationDropdownState extends State<LocationDropdown> {
  String dropdownValue = 'Studio 1';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      borderRadius: const BorderRadius.vertical(),
      isExpanded: true,
      style: const TextStyle(
          color: Colors.grey,
        fontSize: 14,
      ),
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Studio 1', 'Studio 2', 'Bibliothek', 'Office']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}