import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/news_model.dart';
import '../../services/http_servic.dart';
import '../../services/log_service.dart';



class GetxPageController extends GetxController{
  bool isLoading = true;
  List<Article> newsList = [];



  apiCoinNewsList() async{
    var response = await Network.GET(Network.API_SEARCH, Network.paramsCoinNewsList());
    LogService.i(response.toString());
    isLoading = false;

    if (response != null){
      var coinNews =  Network.parseCoinNewsList(response);
      newsList = coinNews.articles;
      isLoading = false;
      update();
    }else{
      isLoading = true;
      update();
    }
  }
  Future<void> urllaunch(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  handleRefresh(){
    apiCoinNewsList();
  }
  tohome(){
    Get.back();
  }
}