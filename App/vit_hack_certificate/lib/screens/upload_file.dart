import 'package:flutter/material.dart';
import 'package:vit_hack_certificate/constants.dart';

import '../constants.dart';

class UploadFileOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'HACK_CERTIFICATE',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: kLoginButtonColour,
      ),
      backgroundColor: kAppBackgroundColour,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'images/login.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
