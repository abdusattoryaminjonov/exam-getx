import 'package:get/get.dart';

import '../controllers/getx_controller.dart';



class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetxPageController(), fenix: true);
  }
}