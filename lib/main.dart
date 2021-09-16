import 'package:flutter/material.dart';
import 'forms.dart';
import 'home.dart';

void main(){
  runApp(const TQW());
}

class TQW extends StatelessWidget{
   const TQW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber
      ),
        home: const HomeScreen()
    );
  }
}
