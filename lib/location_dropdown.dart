import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationDropdown extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const LocationDropdown({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<LocationDropdown> createState() => _LocationDropdownState();
}

class _LocationDropdownState extends State<LocationDropdown> {
  String dropdownValue = 'Studio 1';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.location_pin),
        hintText: AppLocalizations.of(context)!.location,
      ),
      items: <String>[
        'Halle G (Party)',
  //      'Studio 1',
   //     'Studio 2',
    //    'Studio 3',
    //    AppLocalizations.of(context)!.biblio,
     //   AppLocalizations.of(context)!.office,
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          widget.onChanged(newValue!);
          dropdownValue = newValue;
        });
      },
    );
  }
}