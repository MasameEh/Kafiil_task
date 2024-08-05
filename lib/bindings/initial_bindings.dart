import 'package:get/get.dart';

import '../shared/class/crud.dart';


class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud()) ;
  }
}