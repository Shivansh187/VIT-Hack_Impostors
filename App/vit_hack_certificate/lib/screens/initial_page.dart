import 'package:flutter/material.dart';
import 'package:vit_hack_certificate/constants.dart';

// This is the Initial page screen that has the option of login or register
class LoginOrRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBackgroundColour,
      body: Stack(
        children: [
          // Container for the background image
          Container(
            height: MediaQuery.of(context)
                .size
                .height, // to make the container height equal to height of the device
            width: MediaQuery.of(context)
                .size
                .width, // to make the width equal to the width of the device
            child: Image.asset(
              'images/login.jpeg', // importing the image for background
              fit: BoxFit.cover, // To cover the entire screen
            ),
          ),
          // Column for adding appName, login and Registration
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container to store name of the app
                Container(
                  child: Text(
                    'HACK_CERTIFICATE',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
                // Container to have the login button
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                LoginOrRegisterButton(text: 'Login'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                LoginOrRegisterButton(text: 'Register'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LoginOrRegisterButton extends StatelessWidget {
  LoginOrRegisterButton({@required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
        ),
      ),
      decoration: BoxDecoration(
        color: kLoginButtonColour,
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
    );
  }
}
