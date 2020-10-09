import 'package:flutter/material.dart';
import 'package:vit_hack_certificate/constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

bool visible = false;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.23,
            ),
            Center(
              child: Text(
                "Enter Credentials",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: kAppBackgroundColour),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  validator: (value) {
                    if (value == '') {
                      return 'This field is required.';
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: new InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    contentPadding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    hintText: 'email id',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  validator: (value) {
                    if (value == '') {
                      return 'This field is required.';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !visible,
                  style: TextStyle(color: Colors.black),
                  decoration: new InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    contentPadding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            visible = !visible;
                          });
                        }),
                    enabledBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(27.5)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.3,
                child: FlatButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: Colors.redAccent,
                  child: Container(
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
