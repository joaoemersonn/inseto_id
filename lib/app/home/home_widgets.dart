import 'package:flutter/material.dart';
import 'package:inseto_id/app/home/home_bloc.dart';
import 'package:inseto_id/app/home/home_module.dart';
import 'package:inseto_id/app/identificar/identificar_bloc.dart';
import 'package:inseto_id/app/identificar/identificar_module.dart';
import 'package:inseto_id/app/shared/temas.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc bloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("INSETO ID"),
      )),
      drawer: _menuHamburguer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _botaoMenu(Image.asset("images/cam.png", width: 150), "IDENTIFICAR",
              funcaobotao: () => Navigator.pushNamed(context, 'identificar')),
          _botaoMenu(Image.asset("images/catalogo.png", width: 150), "CATÁLOGO",
              funcaobotao: () => Navigator.pushNamed(context, 'catalogo'))
        ],
      ),
    );
  }

  Container _botaoMenu(Image ico, String texto,
      {Function funcaobotao, int avisos, double tam = 400}) {
    return Container(
      padding: EdgeInsets.all(10),
      width: tam,
      height: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.grey)),
          elevation: 10,
        ),
        onPressed: funcaobotao,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            avisos != null && avisos > 0
                ? Padding(
                    padding: EdgeInsets.only(left: 110),
                    child: CircleAvatar(
                      radius: 15,
                      child: Text(avisos.toString()),
                    ),
                  )
                : Container(),
            ico,
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              texto,
              style: TextStyle(color: CORPRICIPAL, fontSize: 40),
            )
          ],
        ),
      ),
    );
  }

  _menuHamburguer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 85,
            child: DrawerHeader(
              child: Text(
                'OPÇÕES',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              decoration: BoxDecoration(
                color: CORPRICIPAL,
              ),
            ),
          ),
          ListTile(
            title: Text('Configurações'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Sobre'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
