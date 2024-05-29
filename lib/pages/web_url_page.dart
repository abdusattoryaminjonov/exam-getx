import 'package:examgetxbloc/controllers/getx_controller.dart';
import 'package:examgetxbloc/services/log_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebUrlPage extends StatefulWidget {
  final String? urlNews;

  const WebUrlPage({super.key,this.urlNews});

  @override
  State<WebUrlPage> createState() => _WebUrlPageState();
}

class _WebUrlPageState extends State<WebUrlPage> {
  final homeController = Get.find<GetxPageController>();
  late WebViewController controller;
  String? url;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    url = widget.urlNews!;
    if (url != null && Uri.tryParse(url!) != null) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(url!));
    } else {
      LogService.i('Invalid or null URL');
    }
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
            Navigator.pop(context);
          },
          child: Container(
            child: Icon(Icons.arrow_back ,color: Colors.white,),
          ),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
