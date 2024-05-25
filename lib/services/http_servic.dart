import 'dart:convert';

import 'package:examgetxbloc/models/news_model.dart';
import 'package:examgetxbloc/services/log_service.dart';
import 'package:http/http.dart';


class Network {
  static bool isTester = true;
  static String SERVER_DEV = "newsapi.org";
  static String SERVER_PROD = "newsapi.org";
  static String KEY = "d761e4b0f98549508c52b0e578b09024";

  static String getServer() {
    if (isTester) return SERVER_DEV;
    return SERVER_PROD;
  }

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'x-api-key': 'd761e4b0f98549508c52b0e578b09024'
  };

  /* Http Request*/

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(getServer(), api, params);
    LogService.e(uri.toString());
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }


  static String API_SEARCH = "/v2/everything";

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static Map<String, String> paramsCoinNewsList() {
    Map<String, String> params = new Map();
    params.addAll({
      'q': 'bitcoin',
      'apiKey':"d761e4b0f98549508c52b0e578b09024"
    });
    return params;
  }
  static List<Article> parseCoinNewsList(String response) {
    dynamic json = jsonDecode(response);
    return CoinNews.fromJson(json).articles;
  }
}