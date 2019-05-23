import 'package:flutter/material.dart';
import 'package:ung_food_land/screens/register.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  final formKey = GlobalKey<FormState>();
  String user, password;

  Widget showSignUp(BuildContext context) {
    return RaisedButton(
      child: Text('Sign Up'),
      onPressed: () {
        print('You Click SignUp');

        // Create Router
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget showSignIn() {
    return RaisedButton(
      child: Text('Sign In'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          checkUserAndPassword();
        }
      },
    );
  }

  void checkUserAndPassword() async {

    String urlPHP = 'https://www.androidthai.in.th/tid/getUserWhereUserMaster.php?isAdd=true&User=$user';

  }

  Widget showPassword() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password :', hintText: 'More 6 Charactor'),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Password ต้องมากกว่า 6 ตัวอักษร';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget showUser() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'User :', hintText: 'Your User'),
      validator: (String value) {
        if (value.length == 0) {
          return 'กรอก User ด้วยคะ';
        }
      },
      onSaved: (String value) {
        user = value;
      },
    );
  }

  Widget showLogo() {
    return Image.asset('images/logo.png');
  }

  Widget showTitle() {
    return Text(
      'Ung Food Land',
      style: TextStyle(
          fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.red[900]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.yellow[900]],
                    begin: Alignment(-1, -1))),
            padding: EdgeInsets.only(top: 70.0),
            alignment: Alignment(0, -1),
            child: Column(
              children: <Widget>[
                showLogo(),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: showTitle(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: showUser(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: showPassword(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: showSignIn(),
                      ),
                      Expanded(
                        child: showSignUp(context),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
