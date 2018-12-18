import 'package:crud_app/main.dart';
import 'package:crud_app/page1.dart';
import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";


class MyTask extends StatefulWidget {
  MyTask({this.user, this.googleSignIn});

  final FirebaseUser user;
  final GoogleSignIn googleSignIn;

  @override
  _MyTaskState createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {

  Widget buildPage(String title, Color color){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.network(widget.user.photoUrl),
          new Text(widget.user.displayName),
          new Text(title)
        ],
      ),
    );
  }

  Widget buildPageView(){
    return PageView(
      children: <Widget>[
        buildPage("Pagina Principal", Colors.deepOrange),
        buildPage("Pagina Secundaria", Colors.amber),
        buildPage("Pagina Otra Mas", Colors.greenAccent),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Pagina de Inicio"),
        backgroundColor: Colors.lightBlue,
      ),
      body: buildPageView()
    );
  }
}
