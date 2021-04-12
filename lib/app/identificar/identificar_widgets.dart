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
                  Expanded(
                    child:
                        Container(child: CameraPreview(bloc.cameracontroller)),
                  ),
                  Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              border: Border.all(color: Colors.grey),
                              color: Colors.grey),
                          child: Text(
                              ' Aponte para um inseto para começar a indentificar! ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              )),
                        ),
                        Container(
                          height: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              StreamBuilder<bool>(
                                  stream: bloc.flashOut,
                                  initialData: false,
                                  builder: (context, snapshot) {
                                    return RawMaterialButton(
                                      onPressed: bloc.desligar_ligar_flash,
                                      elevation: 2.0,
                                      fillColor: Colors.green,
                                      child: snapshot.data
                                          ? Icon(
                                              Icons.flash_off,
                                              color: Colors.white,
                                              size: 35.0,
                                            )
                                          : Icon(
                                              Icons.flash_on,
                                              color: Colors.white,
                                              size: 35.0,
                                            ),
                                      padding: EdgeInsets.all(15.0),
                                      shape: CircleBorder(),
                                    );
                                  }),
                              RawMaterialButton(
                                onPressed: () {},
                                elevation: 2.0,
                                fillColor: Colors.green,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                ),
                                padding: EdgeInsets.all(15.0),
                                shape: CircleBorder(),
                              ),
                              RawMaterialButton(
                                onPressed: () {},
                                elevation: 2.0,
                                fillColor: Colors.green,
                                child: Icon(
                                  Icons.help_outline_outlined,
                                  color: Colors.white,
                                  size: 35.0,
                                ),
                                padding: EdgeInsets.all(15.0),
                                shape: CircleBorder(),
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
