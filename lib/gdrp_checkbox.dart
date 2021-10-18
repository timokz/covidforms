import 'package:flutter/material.dart';

class GdrpCheckbox extends StatefulWidget {
  const GdrpCheckbox({Key? key, required this.onChecked}) : super(key: key);
  final ValueChanged<bool> onChecked;
  @override
  State<GdrpCheckbox> createState() => _GdrpCheckboxState();

  void onChanged(param0) {}
}

class _GdrpCheckboxState extends State<GdrpCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.grey;
      }
      return Colors.black;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          widget.onChecked(value);
        });
      },
    );
  }
}