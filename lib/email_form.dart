import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class EmailForm extends StatefulWidget {
  final ValueChanged<String> onEmailChanged;
  const EmailForm({Key? key, required this.onEmailChanged}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final eController = TextEditingController();
  String guestEmail = "";
  @override
  void dispose() {
    eController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: TextFormField(
            validator: (String? value) {
              return (!value!.contains('@') && value.isNotEmpty && EmailValidator.validate(value))
                  ? 'Incorrect format.'
                  : null;
            },
            autovalidateMode: AutovalidateMode.always,
            keyboardType: TextInputType.emailAddress,
            controller: eController,
            onChanged: (String arg) {
              widget.onEmailChanged(arg);
            },
            style: const TextStyle(fontFamily: 'Arial'),
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.mail),
            )),
      ),
    );
  }
}
