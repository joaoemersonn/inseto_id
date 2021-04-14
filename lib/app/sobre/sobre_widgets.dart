import 'package:flutter/material.dart';
import 'package:inseto_id/app/shared/temas.dart';

class SobrePage extends StatefulWidget {
  @override
  _SobrePageState createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Image.asset(
          "images/iconBranco.png",
          width: 45,
        ),
      )),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              "Sobre:",
              style: TextStyle(color: CORPRICIPAL, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
