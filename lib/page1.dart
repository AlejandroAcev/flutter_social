import 'package:crud_app/main.dart';
import 'package:flutter/material.dart';


class Pagina extends StatefulWidget {
  Pagina({this.icon, this.text});

  Text text;
  Icon icon;

  @override
  _PaginaState createState() => _PaginaState();

}

class _PaginaState extends State<Pagina> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: new Text("Pagina 2"),
        elevation: 20,
      ),
      body: PageView(

      ),
    );
  }
}
