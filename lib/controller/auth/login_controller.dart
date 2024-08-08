
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data_source/auth/login_data.dart';
import '../../services/services.dart';
import '../../shared/class/statusrequest.dart';
import '../../shared/functions/handlingdata.dart';
import '../countries_controller.dart';
import '../services_controller.dart';
import '../who_am_i_controller.dart';



abstract class LoginController extends GetxController{
  void login();
  void gotoSignUp();
  void gotoHomePage();
  void changePasswordVisibility();
}

class LoginControllerImp extends LoginController{

  late TextEditingController emailController;
  late TextEditingController passController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StatusRequest? statusRequest;
  LoginData loginData = LoginData(Get.find());


  WhoAmIControllerImp controller = Get.find();
  CountriesControllerImp countriesController = Get.find();
  ServicesControllerImp servicesController = Get.find();

  bool isPass = true;
  bool isChecked = false;
  bool isError = false;
  IconData suffix = Icons.visibility_off_outlined;
  MyServices services = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    emailController = TextEditingController();
    passController = TextEditingController();

    super.onInit();
  }

  @override
  void changePasswordVisibility() {
    isPass = !isPass;
    suffix = isPass ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    update();
  }

  @override
  void login() async{
    // TODO: implement login
    if(formKey.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
        email: emailController.text,
        pass: passController.text,
      );
      print("RESPONSE request is $response");
      statusRequest = handlingData(response);
      print("statusRequest is $statusRequest");
      if(statusRequest == StatusRequest.success){
        if(response["success"] == true){
          //data.addAll(response['data']);
          services.sharedPref.setString("token", response["access_token"]);
          await controller.getData();

          if (controller.user.id != null) {
            // await countriesController.fetchAllCountries();
            // await servicesController.fetchAllServices();
            // await servicesController.fetchAllPopularServices();
            
            print(countriesController.allCountries);
            gotoHomePage();
          } else {
            print("Failed to fetch user data");
          }
        }
        else{
          Get.defaultDialog(title: 'Warning', middleText: "Phone or Email is not correct");
          statusRequest = StatusRequest.serverFailure;
        }
      }else if(statusRequest == StatusRequest.offlineFailure){}
      else{
        Get.defaultDialog(title: 'Warning', middleText: "Phone or Email is not correct");
      }
      update();
    }else {
      print('A7a 3leek');
    }
  }
  @override
  void gotoSignUp() {
    // TODO: implement gotoSignUp
    Get.toNamed('/signup');
  }

  selectRememberMe(bool? value){
    isChecked = value!;
    update();
  }
  @override
  void gotoHomePage(){
    Get.offAllNamed('/homelayout');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passController.dispose();

    super.dispose();
  }


}