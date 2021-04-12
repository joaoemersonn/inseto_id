import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:camera/camera.dart';

class IdentificarBloc extends BlocBase {
  CameraController cameracontroller;
  Future<bool> inicializar() async {
    if (cameracontroller == null) {
      final cameras = await availableCameras();
      cameracontroller = CameraController(cameras[0], ResolutionPreset.max);
      await cameracontroller.initialize();
    }
    print("inicializa camera");
    return true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
