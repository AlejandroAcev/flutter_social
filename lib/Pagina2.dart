import 'package:crud_app/main.dart';
import 'package:crud_app/page1.dart';
import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";


class Pagina2 extends StatefulWidget {
  Pagina2({this.user, this.googleSignIn});

  final FirebaseUser user;
  final GoogleSignIn googleSignIn;

  @override
  _Pagina2State createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {

  void _logout(){

    AlertDialog alertDialog = new AlertDialog(
      title: new Text("¿Seguro que desea cerrar sesión?"),
      content: Container(
          height: 225,
          child: new Column(
            children: <Widget>[
              ClipOval(
                child: new Image.network(widget.user.photoUrl),
              ),
              new Padding(padding: EdgeInsets.only(top: 30)),
              new Text("Se finalizará la sesión actual y se volverá al login", textAlign: TextAlign.center,),
              new Divider(),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: <Widget>[
                  Column(
                    children: <Widget>[
                      InkWell(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.check),
                            new Text("Sí")
                          ],
                        ),
                        onTap: (){
                          widget.googleSignIn.disconnect();
                          Navigator.of(context).push(
                              new MaterialPageRoute(builder: (BuildContext context) => new HomePage())
                          );
                        },
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      InkWell(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.close),
                            new Text("No")
                          ],
                        ),
                        onTap: (){
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ],
              )
            ],
          )
      ),
    );

    //alertDialog.build(context);
    showDialog(context: context, child: alertDialog);

    //widget.googleSignIn.disconnect();
    //Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Container(
        width: double.infinity, height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(image: new AssetImage("img/gradient_top.png"), fit: BoxFit.cover),
          boxShadow: [new BoxShadow(color: Colors.black38, blurRadius: 8)],
          color:  Colors.deepOrange,
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25,),
              child: new Container(
                width: 50, height: 50,
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
