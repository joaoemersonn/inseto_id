import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:inseto_id/app/descricaoInseto/descricao_bloc.dart';
import 'package:inseto_id/app/identificar/identificar_module.dart';
import 'package:inseto_id/app/shared/models/animal_gbif.dart';
import 'package:inseto_id/app/shared/models/images_flickr.dart';
import 'package:inseto_id/app/shared/models/wiki_results.dart';
import 'package:inseto_id/app/shared/temas.dart';

class DescricaoPage extends StatefulWidget {
  @override
  _DescricaoPageState createState() => _DescricaoPageState();
}

class _DescricaoPageState extends State<DescricaoPage> {
  DescricaoBloc bloc = IdentificarModule.to.getBloc<DescricaoBloc>();
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
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: bloc.insetoidOut,
          initialData: bloc.insetoID,
          builder: (context, snapshot) {
            if (snapshot.hasError) return _errorWidget();
            return FutureBuilder(
                future: bloc.getInsetobyID(bloc.insetoID),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return _carregandoWidget();
                  if (snapshot.data != null) {
                    AnimalGBIF inseto = snapshot.data;
                    return Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "INSETO INDENTIFICADO",
                            style: TextStyle(
                                color: CORPRICIPAL,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  FutureBuilder(
                                      future: bloc.getImagensbyTag(
                                          inseto.canonicalName),
                                      builder: (context, snap) {
                                        if (snap.hasError)
                                          return _errorWidget();
                                        if (snap.connectionState ==
                                            ConnectionState.waiting)
                                          return Container(
                                              width: 300,
                                              height: 300,
                                              child: _carregandoWidget());
                                        ImagensFlickr imagens = snap.data;
                                        if (imagens != null &&
                                            imagens.items != null &&
                                            imagens.items.isNotEmpty)
                                          return Container(
                                            width: 300,
                                            height: 300,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border(),
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: Image.network(imagens
                                                            .items[0].media.m)
                                                        .image)),
                                          );
                                        return CircleAvatar(
                                            child: Text(
                                                "N??o foi localizada nenhuma imagem",
                                                textAlign: TextAlign.center),
                                            radius: 100);
                                      }),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                        "Nome comum: ${inseto.canonicalName}"),
                                  )
                                ],
                              )),
                          Text(
                            "NOME CIENT??FICO: ${inseto.scientificName}",
                            style: TextStyle(
                                color: CORPRICIPAL,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("ORDEM: ${inseto.order}"),
                          Text("Fam??lia: ${inseto.family}"),
                          Padding(padding: EdgeInsets.only(bottom: 15)),
                          FutureBuilder(
                              future: bloc.getDescricao(inseto.canonicalName),
                              builder: (context, snap) {
                                if (snap.hasError)
                                  return _errorWidget(erro: "Descri????o!");
                                if (snap.connectionState ==
                                    ConnectionState.waiting)
                                  return Container(
                                      width: 300,
                                      height: 300,
                                      child: _carregandoWidget());
                                WikiResult wiki = snap.data;
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      border: Border.all(
                                          color: CORPRICIPAL, width: 5)),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Descri????o:",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: CORPRICIPAL, fontSize: 25),
                                      ),
                                      (wiki != null &&
                                              wiki.query != null &&
                                              wiki.query.pages.isNotEmpty)
                                          ? Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(15),
                                                  child: SingleChildScrollView(
                                                    child: Html(
                                                      data: wiki.query.pages[0]
                                                          .extract,
                                                    ),
                                                  ),
                                                ),
                                                Text("fonte: Wikip??dia")
                                              ],
                                            )
                                          : Text(
                                              "N??o Foi Localizada Descri????o para este inseto!"),
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    );
                  }
                  return _errorWidget();
                });
          },
        ),
      ),
    );
  }

  Widget _errorWidget({String erro = "dados!"}) {
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
          Text("Erro ao carregar $erro"),
          Text("Verifique sua conex??o com a internet")
        ],
      ),
    );
  }

  Widget _carregandoWidget() {
    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator(), Text("Carregando...")]),
    );
  }
}
