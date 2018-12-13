import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:cloud_firestore/cloud_firestore.dart";


class MyTask extends StatefulWidget {
  MyTask({this.user, this.googleSignIn});

  final FirebaseUser user;
  final GoogleSignIn googleSignIn;

  @override
  _MyTaskState createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {

  void _logout(){
    widget.googleSignIn.disconnect();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        width: double.infinity, height: 120,
        decoration: BoxDecoration(
          image: DecorationImage(image: new AssetImage("img/gradient_top.png"), fit: BoxFit.cover),
          boxShadow: [new BoxShadow(color: Colors.black38, blurRadius: 8)],
          color:  Colors.deepOrange,
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25, ),
              child: new Container(
                width: 60, height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: new NetworkImage(widget.user.photoUrl))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 8),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(widget.user.displayName, style: new TextStyle(fontSize: 20, color: Colors.white,),)
                ],
              ),
            ),
            new Expanded(child:
              Padding(
                  padding: const EdgeInsets.only(right: 15, top: 25,),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      new IconButton(icon: Icon(Icons.exit_to_app, color: Colors.white, size: 30),
                        onPressed: (){
                          _logout();
                        },),

                    ],
                  )
              )
            )
          ],
        ),

      ),
    );
  }
}
