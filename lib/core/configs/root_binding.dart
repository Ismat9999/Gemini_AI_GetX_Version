

import 'package:geminigetx/presentation/controller/starter_controller.dart';
import 'package:get/get.dart';

import '../../presentation/controller/home_controller.dart';

class RootBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>StarterController(),fenix: true);
    Get.lazyPut(()=>HomeController(),fenix: true);
  }
}