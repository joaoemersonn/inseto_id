import 'package:flutter/material.dart';

class CatalogoPage extends StatefulWidget {
  @override
  _CatalogoPageState createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning,
                    size: 100,
                    color: Colors.red,
                  ),
                  Text("Erro ao carregar dados!"),
                  Text("Verifique sua conexão com a internet")
                ],
              ),
            );
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text("Carregando...")
                  ]),
            );
          if (!snapshot.hasData) return Center(child: Text("Não há dados!"));
          return SingleChildScrollView(
            child: Column(
              children: [],
            ),
          );
        },
      ),
    );
  }
}
