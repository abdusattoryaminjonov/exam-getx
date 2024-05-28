import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/getx_controller.dart';
import '../views/item_of_getxpage.dart';

class GetxPage extends StatefulWidget {
  const GetxPage({super.key});

  @override
  State<GetxPage> createState() => _GetxPageState();
}

class _GetxPageState extends State<GetxPage> {
  final homeController = Get.find<GetxPageController>();

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
        backgroundColor: Colors.amberAccent,
        title: Text("BitCoin News GetX",style: TextStyle(color: Colors.white),),
        leading: GestureDetector(
            onTap: () {
              homeController.apiCoinNewsList();
            },
          child: Container(
              child: Image.asset("assets/images/bitcoin.png"),
          ),
        ),
      ),
      body: GetBuilder<GetxPageController>(
        builder: (_){
          return Stack(
            children: [
              ListView.builder(
                itemCount: homeController.newsList.length,
                itemBuilder: (ctx, index) {
                  return itemOfNews(homeController.newsList[index],homeController);
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
      ),

    );
  }


}
