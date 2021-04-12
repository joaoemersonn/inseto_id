import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:inseto_id/app/identificar/identificar_bloc.dart';
import 'package:inseto_id/app/identificar/identificar_module.dart';

class IdentificarPage extends StatefulWidget {
  @override
  _IdentificarPageState createState() => _IdentificarPageState();
}

class _IdentificarPageState extends State<IdentificarPage> {
  final IdentificarBloc bloc = IdentificarModule.to.getBloc<IdentificarBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: bloc.inicializar(),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Center(child: Text("ERRO AO INICIALIZAR CAMERA!"));
            else if (!snapshot.hasData)
              return Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: CircularProgressIndicator(),
                        width: 60,
                        height: 60,
                      ),
                      Text("Carregando Módulo de Câmera...")
                    ]),
              );
            else
              return Stack(
                children: [
                  Expanded(child: CameraPreview(bloc.cameracontroller)),
                  Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                        Text(
                            'Aponte para um inseto para começar a indentificar!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                decorationStyle: TextDecorationStyle.wavy)),
                        Container(
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 10),
                              CircleAvatar(
                                radius: 30,
                              ),
                            ],
                          ),
                        )
                      ]))
                ],
              );
          }),
    );
  }
}
