import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:camera/camera.dart';
import 'package:inseto_id/app/shared/models/animal_gbif.dart';
import 'package:inseto_id/app/shared/services/GBIF.dart';

class IdentificarBloc extends BlocBase {
  CameraController cameracontroller;
  bool _flashbool = false;
  var _flash = StreamController<bool>();
  Sink<bool> get flashIn => _flash.sink;
  Stream<bool> get flashOut => _flash.stream;

  void desligar_ligar_flash() {
    try {
      _flashbool = !_flashbool;
      cameracontroller
          .setFlashMode(_flashbool ? FlashMode.torch : FlashMode.off);
      _flash.add(_flashbool);
    } catch (e) {}
  }

  Future<bool> inicializar() async {
    if (cameracontroller == null) {
      final cameras = await availableCameras();
      cameracontroller =
          CameraController(cameras[0], ResolutionPreset.ultraHigh);
      await cameracontroller.initialize();
    }
    return true;
  }

  Future<String> identificar() async {
    //COLOCAR API IDENTINFICAR
    await Future.delayed(Duration(seconds: 1));

    return "1035185";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _flash.close();
    cameracontroller.dispose();
    super.dispose();
  }
}
