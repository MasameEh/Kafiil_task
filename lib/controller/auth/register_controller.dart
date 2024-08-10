import 'package:flutter/material.dart';
import 'package:get/get.dart';




abstract class RegisterController extends GetxController{
  void changePasswordVisibility();
  void changePasswordConfVisibility();
  void gotoCompleteData();
}


class RegisterControllerImp extends RegisterController{

  bool isPass = true;
  bool isPassConf = true;
  bool isChecked = false;
  bool isError = false;
  IconData suffix = Icons.visibility_off_outlined;
  IconData suffixConf = Icons.visibility_off_outlined;

  String? selectedUserType;

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController confirmpassController;

  int activeStep = 0;


  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    passController = TextEditingController();
    emailController = TextEditingController();
    confirmpassController = TextEditingController();

    super.onInit();
  }

  @override
  void changePasswordVisibility() {
    isPass = !isPass;
    suffix = isPass ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    update();
  }

  @override
  void changePasswordConfVisibility() {
    isPassConf = !isPassConf;
    suffixConf = isPassConf ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    update();
  }


  userTypeSelect(String? val){
    selectedUserType = val;
    update();
  }
  @override
  gotoCompleteData() async{

      if(formKey.currentState!.validate()){
        if(passController.text != confirmpassController.text){
          return Get.defaultDialog(title: 'Warning', middleText: "Passwords do not match");
        }
        Get.toNamed('/completedata', arguments: {
          "firstname": firstNameController.text,
          "lastname": lastNameController.text,
          "email": emailController.text,
          "password": passController.text,
          "usertype": selectedUserType,
        });
        isError = false;
        update();
      }else{
        isError = true;
        update();
      }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    confirmpassController.dispose();
    isError = false;
    super.dispose();
  }
}