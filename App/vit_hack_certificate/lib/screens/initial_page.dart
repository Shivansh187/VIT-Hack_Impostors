import 'package:flutter/material.dart';
import 'package:vit_hack_certificate/constants.dart';

// This is the Initial page screen that has the option of login or register
class LoginOrRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBackgroundColour,
      body: Container(
          height: MediaQuery.of(context)
              .size
              .height, // to make the container height equal to height of the device
          width: MediaQuery.of(context)
              .size
              .width, // to make the width equal to the width of the device
          child: Image.asset(
            'images/login.jpeg', // importing the image for background
            fit: BoxFit.cover, // To cover the entire screen
          )),
    );
  }
}
