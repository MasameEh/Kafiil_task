import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kafil/api_links.dart';
import 'package:kafil/shared/class/crud.dart';

import '../data/models/user.dart';
import '../services/services.dart';
import '../shared/class/statusrequest.dart';

abstract class WhoAmIController extends GetxController{
  void changePasswordVisibility();
  void getData();
}

class WhoAmIControllerImp extends WhoAmIController{

  MyServices services = Get.find();
  Crud crud = Get.find();

  Map data = {};

  bool isPass = true;
  bool isChecked = false;
  String? selectedGender;
  String? selectedUserType;
  late TextEditingController passController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController aboutController;
  late TextEditingController salaryController;
  late TextEditingController dateController;

  var user = UserModel();

  StatusRequest? statusRequest;

  IconData suffix = Icons.visibility_off_outlined;
  List<String> checkBoxList = ['Facebook', 'Twitter', 'Linkedin'];
  List<bool?> checked = [true,false,false];
  List<Widget> mediaIcons = [
    const Icon(
      Icons.facebook,
      color: Color(0xFF1877F2),
    ),
    const Icon(
      FontAwesomeIcons.squareTwitter,
      color: Colors.blue,
    ),
    const Icon(
      FontAwesomeIcons.linkedin,
      color: Color(0xFF0077B5), // Normal Facebook color
    ),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    passController = TextEditingController(text: "12345678");
    aboutController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    salaryController = TextEditingController();
    dateController = TextEditingController();
    if(services.sharedPref.containsKey("token")) {
      getData();
    }
  }
  @override
  Future<void> getData() async{
    statusRequest = StatusRequest.loading;
    update();
    String token = services.sharedPref.getString("token")!;
    var response =  await crud.getData(AppLinks.whoAmI, headers:
    {
      'Authorization': token,
      'Accept': 'application/json',
      'Accept-Language': 'ar'
    });

    if(response["success"] == true){
      print(response["data"]);
      data.addAll(response["data"]);
      user = UserModel.fromJson(response["data"]);
      selectUserType(user.type!);
      selectGender(user.gender!);
      print(user.id!);
      statusRequest = StatusRequest.success;
      update();
    }else if(response["success"] == false){
      print(response["error"]["message"]);
    }
  }

  selectUserType(UserType type){
    selectedUserType = type.name;
    update();
  }
  selectGender(int gender){
    gender == 0 ? selectedGender = "Female": selectedGender = "Male";
    update();
  }


  @override
  changePasswordVisibility(){

    isPass = !isPass;
    suffix = isPass ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    update();
  }

  logOut(){
    services.sharedPref.remove("token");
    Get.offAllNamed("/");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    salaryController.dispose();
    aboutController.dispose();
    dateController.dispose();

    super.dispose();
  }
}
