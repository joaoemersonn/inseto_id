import 'package:dio/dio.dart';
import 'package:inseto_id/app/shared/models/wiki_results.dart';

class WIKIAPI {
  WIKIAPI._();

  static WIKIAPI _instance;

  static WIKIAPI get instance {
    return _instance ??= WIKIAPI._();
  }

  Future<WikiResult> getDescricao(String especie) async {
    String url_api_busca =
        "https://pt.wikipedia.org/w/api.php?action=query&format=json&formatversion=2&list=search&srsearch=$especie";
    var busca = await Dio().get(url_api_busca);
    print(url_api_busca);
    print(busca.data['query']['search']);
    if (busca != null &&
        busca.data != null &&
        busca.data['query']['search'] != null && busca.data['query']['search'].length != 0){
      String titulo = busca.data['query']['search'][0]['title'];
      String url_api =
          "https://pt.wikipedia.org/w/api.php?action=query&prop=extracts&exintro=&titles=$titulo&format=json&formatversion=2";
      print(url_api);
      var resposta = await Dio().get(url_api);
      var wiki = WikiResult.fromJson(resposta.data);
      print(wiki.query);
      return wiki;
    }
    return null;
  }
}
