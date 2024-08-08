import 'package:get/get.dart';
import 'package:kafil/shared/class/crud.dart';

import '../api_links.dart';
import '../shared/class/statusrequest.dart';

abstract class ServicesController extends GetxController{

  void fetchAllServices();
}

class ServicesControllerImp extends ServicesController{
  Crud crud = Get.find();
  StatusRequest? statusRequest;

  List allServices = [];
  List allPopularServices = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllServices();
    fetchAllPopularServices();
  }

  @override
  Future<void> fetchAllServices() async {

    var response = await crud.getData(AppLinks.services, headers: {
      'Accept': 'application/json',
      'Accept-Language': 'ar'
    });

    if(response["status"] == 200){
      statusRequest = StatusRequest.success;
      update();
      allServices.addAll(response['data']);
      print(allServices);
    }else {
      // Handle the case where the API indicates failure
      print("Failed to fetch data: ${response['message']}");
    }

  }
  Future<void> fetchAllPopularServices() async {

    var response = await crud.getData(AppLinks.servicesPopular, headers: {
      'Accept': 'application/json',
      'Accept-Language': 'ar'
    });

    if(response["status"] == 200){
      allPopularServices.addAll(response['data']);
      print(allPopularServices);
    }else {
      // Handle the case where the API indicates failure
      print("Failed to fetch data: ${response['message']}");
    }

  }
}