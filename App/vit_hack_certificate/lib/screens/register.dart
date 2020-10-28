import 'package:flutter/material.dart';
import 'package:vit_hack_certificate/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vit_hack_certificate/screens/upload_file.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';
class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

bool visible = false, visible1 = false;

class _RegisterState extends State<Register> {
  @override
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.16,
            ),
            // Container that prints Welcome
            Center(
              child: Text(
                "Welcome!!",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: kAppBackgroundColour),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            // Container that prints next line after welcome
            Center(
              child: Text(
                "Enter Details to register",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kAppBackgroundColour),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            // Container that takes the username

            // Container that takes the email id of the user
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  onChanged: (value) {
                    email = value;
                    print(email);
                  },
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
                    hintText: 'Email ID',
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
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            // Container that takes in the password
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
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
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            // Container that takes in the confirmed password
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  validator: (value) {
                    if (value == '') {
                      return 'This field is required.';
                    } else if (password != value) {
                      return 'Password did not match with that provided';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !visible1,
                  style: TextStyle(color: Colors.black),
                  decoration: new InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    contentPadding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    hintText: 'Confirm ',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            visible1 = !visible1;
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
            // button for registration
            // Once register it would take you to the login page
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.3,
                child: FlatButton(
                  onPressed: () async {
                    print(email);
                    print(password);
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()),
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: Colors.redAccent,
                  child: Container(
                    child: Text(
                      "Register",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
