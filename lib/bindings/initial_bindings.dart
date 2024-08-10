import 'package:get/get.dart';
import 'package:kafil/controller/auth/complete_data_controller.dart';
import 'package:kafil/controller/stringmultitags_controller.dart';

import '../controller/countries_controller.dart';
import '../controller/services_controller.dart';
import '../controller/who_am_i_controller.dart';
import '../shared/class/crud.dart';


class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud()) ;
    Get.put(WhoAmIControllerImp());
    Get.put(CountriesControllerImp());
    Get.put(ServicesControllerImp());
    Get.put(MultiTagsController());
  }
}