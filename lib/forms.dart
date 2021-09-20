import 'package:flutter/material.dart';

// Define a custom Form widget.
class GuestForms extends StatefulWidget {
  const GuestForms({Key? key}) : super(key: key);

  @override
  GuestFormsState createState() {
    return GuestFormsState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class GuestFormsState extends State<GuestForms> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(validator: (value) {
            if (value == null || value.isEmpty) {
              return "Empty Form Field";
            }
            return null;
          }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.amber)),
              onPressed: () {
// Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
// If the form is valid, display a snackbar. In the real world,
// you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),

// Add TextFormFields and ElevatedButton here.
        ],
      ),
    );
  }
}

