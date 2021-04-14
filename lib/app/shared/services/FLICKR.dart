import 'package:dio/dio.dart';
import 'package:inseto_id/app/shared/models/images_flickr.dart';

class FLICKR {
  FLICKR._();

  static FLICKR _instance;

  static FLICKR get instance {
    return _instance ??= FLICKR._();
  }

  Future<ImagensFlickr> getFotosbyTag(String tag) async {
    String url_api =
        "https://api.flickr.com/services/feeds/photos_public.gne?tags=${tag}&format=json&nojsoncallback=1";
    var resposta = await Dio().get<Map<String, dynamic>>(url_api);
    return ImagensFlickr.fromJson(resposta.data);
  }
}
