import 'package:get/get.dart';

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
      newsList =  Network.parseCoinNewsList(response);
      isLoading = false;
      update();
    }else{
      isLoading = true;
      update();
    }
  }

  handleRefresh(){
    apiCoinNewsList();
  }
  tohome(){
    Get.back();
  }
}