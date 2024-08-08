import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../services/services.dart';

class MyMiddleWare extends GetMiddleware{

  @override
  int get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route){
    if(myServices.sharedPref.containsKey("token")){
      return const RouteSettings(name: '/homelayout');
    }
    return null;
  }
}