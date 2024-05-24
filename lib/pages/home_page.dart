import 'package:examgetxbloc/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../views/item_of_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.apiCoinNewsList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text("BitCoin News",style: TextStyle(color: Colors.white),),
      ),
      body: GetBuilder<HomeController>(
        builder: (_){
          return Stack(
            children: [
              ListView.builder(
                itemCount: homeController.newsList.length,
                itemBuilder: (ctx, index) {
                  return itemOfNews(homeController.newsList[index]);
                },
              ),
              homeController.isLoading
                  ? Center(
                child: Lottie.asset("assets/lottie/loding.json"),
              )
                  : SizedBox.shrink(),
            ],
          );
        },
      )
    );
  }


}
