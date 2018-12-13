import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import 'myTask.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
    );
    
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (BuildContext context) => new MyTask(user: firebaseUser, googleSignIn: googleSignIn,)
      )
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  new Container(
        child:
        new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image.asset("img/logo.png", fit:BoxFit.fill, height: 300, width: 300,),
              new Padding(padding: const EdgeInsets.only(bottom: 30.0)),
              new InkWell(
                onTap: (){
                  _signIn();
                },
                child: new Image.asset('img/sign_in_google.png', fit:BoxFit.scaleDown),
              )
            ]
        ),
      ),
    );
  }
}
