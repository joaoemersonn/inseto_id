import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:inseto_id/app/shared/models/animal_gbif.dart';
import 'package:inseto_id/app/shared/models/images_flickr.dart';
import 'package:inseto_id/app/shared/services/FLICKR.dart';
import 'package:inseto_id/app/shared/services/GBIF.dart';
import 'package:rxdart/rxdart.dart';

class DescricaoBloc extends BlocBase {
  String _insetoID = "";
  var _insetoIDStream = BehaviorSubject<String>();
  StreamSink<String> get _insetoidIn => _insetoIDStream.sink;
  ValueStream<String> get insetoidOut => _insetoIDStream.stream;

  get insetoID => _insetoID;

  @override
  void dispose() {
    // TODO: implement dispose
    _insetoIDStream.close();
    super.dispose();
  }

  void setInsetoID(String i) {
    _insetoID = i;
    _insetoidIn.add(_insetoID);
  }

  Future<ImagensFlickr> getImagensbyTag(String busca) {
    return FLICKR.instance.getFotosbyTag(busca);
  }

  Future<AnimalGBIF> getInsetobyID(String insetoid) async {
    print(insetoid);
    if (insetoid == null || insetoid.isEmpty) insetoid = _insetoID;
    print(insetoid);
    if (insetoid == null || insetoid.isEmpty) return null;
    AnimalGBIF animal = await GBIF.instance.getAnimalByUID(insetoid);
    print(animal.canonicalName);
    return animal;
  }
}
