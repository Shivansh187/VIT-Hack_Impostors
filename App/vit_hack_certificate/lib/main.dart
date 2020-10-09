import 'package:flutter/material.dart';
import 'package:vit_hack_certificate/screens/initial_page.dart';
import 'constants.dart';
import 'package:vit_hack_certificate/screens/initial_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VIT hack Certificate',
      theme: ThemeData.dark().copyWith(backgroundColor: kAppBackgroundColour),
      home: LoginOrRegister(),
    );
  }
}
