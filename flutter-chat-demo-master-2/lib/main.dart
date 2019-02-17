import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_demo/chat.dart';
import 'package:flutter_chat_demo/const.dart';
import 'package:flutter_chat_demo/login.dart';
import 'package:flutter_chat_demo/settings.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_chat_demo/channels.dart';

// sets the entry point in their application
void main() => runApp(new MyApp());

class MainScreen extends StatefulWidget {
  final String currentUserId;
<<<<<<< HEAD


=======
// servers initialising a main home screen
>>>>>>> 184e65c60d661626804cf4595094bbd98ad41658
  MainScreen({Key key, @required this.currentUserId}) : super(key: key);

  @override
  State createState() => new Channels(
      // ignore: return_of_invalid_type, return_of_invalid_type
      currentUserId: currentUserId);
}




class Main extends StatelessWidget {
  final String currentUserId;
  final String name;
  Main({Key key, @required this.currentUserId, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new MainScreenss(
        currentUserId: this.currentUserId,
      ),
    );
  }
}

class MainScreenss extends StatefulWidget {
  final String currentUserId;
  final String name;
  MainScreenss({Key key, @required this.currentUserId,this.name}) : super(key: key);

  @override
  State createState() => new MainScreenStatess(currentUserId: this.currentUserId,name: this.name);
}

<<<<<<< HEAD
=======

//  class  where we do all the necessary configuration and start designing UI

class MainScreenState extends State<MainScreen> {
  MainScreenState({Key key, @required this.currentUserId});
>>>>>>> 184e65c60d661626804cf4595094bbd98ad41658



class MainScreenStatess extends State<MainScreenss> {
  final String name;
  final String currentUserId;

  MainScreenStatess({Key key, @required this.currentUserId, this.name});



  bool isLoading = false;
  List<Choice> choices = const <Choice>[
    const Choice(title: 'Settings', icon: Icons.settings),
    const Choice(title: ' but', icon: Icons.exit_to_app),
  ];
//  feature  which holds
  Future<bool> onBackPress() {
    Navigator.pop(context);
    return Future.value(false);
  }

  // here we do button configuration
  Future<Null> openDialog() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            contentPadding:
                EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
            //   configuring the exit button
            children: <Widget>[
              Container(
                color: themeColor,
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                height: 100.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.exit_to_app,
                        size: 30.0,
                      ),
                      margin: EdgeInsets.only(bottom: 10.0),
                    ),
                    Text(
                      'Exit app',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Are you sure to exit app?',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 0);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.cancel,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      'CANCEL',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 1);
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.check_circle,
                      ),
                      margin: EdgeInsets.only(right: 10.0),
                    ),
                    Text(
                      'YES',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          );
        })) {
      case 0:
        break;
      case 1:
        exit(0);
        break;
    }
  }
  // configuring  the chat cell  with all necessary information such as picture URL





  Widget buildItem(BuildContext context, DocumentSnapshot document) {
    if (document['id'] == currentUserId) {
      return Container();
    } else {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(7.0),
        ),

        child: FlatButton(
          child: Row(
            children: <Widget>[
              Material(
                child: CachedNetworkImage(
                  placeholder: Container(
                    child: CircularProgressIndicator(
                      strokeWidth: 1.0,
                      valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                    ),
                    width: 50.0,
                    height: 50.0,
                    padding: EdgeInsets.all(15.0),
                  ),
                  imageUrl: document['photoUrl'],
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                clipBehavior: Clip.hardEdge,

              ),
              new Flexible(
                child: Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        child: Text(
                          //  sets the text property nickname  within the nickname of the chat bubble
                          'Nickname: ${document['nickname']}',
                        ),
                        alignment: Alignment.centerLeft,
                        margin: new EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                      ),
                      new Container(
                        child: Text(
                          'About me: ${document['aboutMe'] ?? 'Not available'}',

                        ),
                        alignment: Alignment.centerLeft,
                        margin: new EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      )
                    ],
                  ),
                  margin: EdgeInsets.only(left: 20.0),
                ),
              ),
            ],
          ),
          onPressed: () {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new Chat(
                          peerId: document.documentID,
                          peerAvatar: document['photoUrl'],
                        )));
          },
          color: Colors.black54,

          padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        ),
        margin: EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0),
      );
    }
  }
//  is handled is Google signing
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  void onItemMenuPress(Choice choice) {
    if (choice.title == 'Log out') {
      Navigator.pop(context);
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Settings()));
    }
  }

  Future<Null> handleSignOut() async {
    this.setState(() {
      isLoading = true;
    });

    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();

    this.setState(() {
      isLoading = false;
    });

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MyApp()),
        (Route<dynamic> route) => false);
  }

  @override
  //  this widget is responsible to display  the main text  on the home page
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Group",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: onItemMenuPress,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                    value: choice,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          choice.icon,
                        ),
                        Container(
                          width: 10.0,
                        ),
                        Text(
                          choice.title,
                        ),
                      ],
                    ));
              }).toList();
            },
          ),
        ],
      ),
      //  this configures the necessary information which we get from the database such as username et cetera
      body: WillPopScope(
        child: Stack(
          children: <Widget>[
            // List
            Container(
              child: StreamBuilder(
                
                stream: Firestore.instance.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      itemBuilder: (context, index) =>
                          buildItem(context, snapshot.data.documents[index]),
                      itemCount: snapshot.data.documents.length,
                    );
                  }
                },
              ),
            ),

            // Loading
            Positioned(
              child: isLoading
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(themeColor)),
                      ),
                      color: Colors.white.withOpacity(0.8),
                    )
                  : Container(),
            )
          ],
        ),
        onWillPop: onBackPress,
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}
