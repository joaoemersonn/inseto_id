//https://api.gbif.org/v1/species/${especieid}
import 'package:dio/dio.dart';
import 'package:inseto_id/app/shared/models/animal_gbif.dart';

class GBIF {
  GBIF._();

  static GBIF _instance;

  static GBIF get instance {
    return _instance ??= GBIF._();
  }

  Future<AnimalGBIF> getAnimalByUID(String especieid) async {
    String url_api = "https://api.gbif.org/v1/species/$especieid";
    var resposta = await Dio().get(url_api);
    return AnimalGBIF.fromJson(resposta.data);
  }
}
