import 'package:get/get.dart';

import '../controller/who_am_i_controller.dart';
import '../shared/class/crud.dart';


class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud()) ;
    Get.put(WhoAmIControllerImp());
  }
}