import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_demo/const.dart';
import 'package:flutter_chat_demo/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget{
  final myControllerEmail = TextEditingController();
  final myControllerPassword = TextEditingController();

  Widget _buildBody() {
    return new Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(top: 34.0),
              child: Text(
                'BChat',
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[900],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
              child: ListView(
                  children: <Widget>[
              Column(
              crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
              Padding(
              padding: const EdgeInsets.all(4.0),
              child: new TextField(
                controller: myControllerEmail,
                style: new TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.pinkAccent,width: 2.0)
                  ),
                  prefixIcon: const Icon(Icons.perm_identity, color: Colors.pinkAccent,),
                  hintText: "Enter your Brookes email",
                  hintStyle: TextStyle(fontSize: 14.0, color: Colors.white),
                ) ,
              ),
            ),
            //new TextField(
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: new TextField(
                obscureText: true,
                style: new TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.pinkAccent, width: 2.0)
                  ),
                  prefixIcon: const Icon(Icons.https, color: Colors.pinkAccent,),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(fontSize: 14.0, color: Colors.white),
                ),
              ),
            ),
            RaisedButton(
                onPressed: () => {
                _checkLogin()
            },
            color: Colors.pinkAccent,
            elevation: 20.0,
            highlightColor: Colors.lightGreenAccent,
            child: new Text(
              'Login',
              style: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
      ],
    ),
    ),
    ),
    Expanded(
    flex: 1,
    child: Container(
    color: Colors.grey[900],
    ),
    ),
    Expanded(
    flex: 1,
    child: Container(
    child: Text(
    'You must study or work at Brookes to use BChat...',
    style: new TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 10.0,
    ),
    ),
    ),
    ),
    ],
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[900],
      body: _buildBody(),
    );
  }





  Widget _checkLogin() {
    bool loginFine = false;
    if (myControllerEmail.text == "Bob") {
      print('true');
    }
    else{
      print(false);
    }
  }

}


