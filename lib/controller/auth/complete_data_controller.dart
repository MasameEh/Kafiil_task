
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kafil/data/data_source/auth/register_data.dart';

import '../../shared/class/statusrequest.dart';
import '../../shared/functions/handlingdata.dart';



abstract class CompleteDataController extends GetxController{

  void register();
  void incrementSalary();
  void decrementSalary();
}


class CompleteDataControllerImp extends CompleteDataController{

  int counter = 100;
  String? selectedGender;
  int? selectedGenderInt;
  List<String> checkBoxList = ['facebook', 'x', 'linkedin'];
  List<String> selectedSocial = [];
  List<bool?> checked = [false,false,false];
  File? selectedImage;
  late TextEditingController aboutController;

  List<Icon> mediaIcons = [
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

  DateTime selectedDate = DateTime.now();
  List data = [];
  RegisterData registerData = RegisterData(Get.find());

  StatusRequest? statusRequest;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  String? firstname;
  String? lastname;
  String? usertype;
  int? userType;


  @override
  void onInit() {
    // TODO: implement onInit
    email     = Get.arguments["email"];
    password  = Get.arguments["password"];
    firstname = Get.arguments["firstname"];
    lastname  = Get.arguments["lastname"];
    usertype  = Get.arguments["usertype"];
    aboutController = TextEditingController();

    if(usertype == 'Buyer'){
      userType = 1;
    }else if(usertype == 'Seller'){
      userType = 2;
    // ignore: curly_braces_in_flow_control_structures
    }else userType = 3;
    super.onInit();
  }


  @override
  register() async{
    if(formKey.currentState!.validate() && selectedImage != null &&
        selectedDate.isBefore(DateTime.now()) &&
        selectedGender != null && selectedSocial.isNotEmpty){
      statusRequest = StatusRequest.loading;
      update();
      var response = await registerData.postData(
        email: email!,
        pass: password!,
        firstname: firstname!,
        lastname: lastname!,
        type: userType!,
        about: aboutController.text.trim(),
        birthDate: DateFormat('yyyy-MM-dd').format(selectedDate),
        salary: counter,
        socialMedia: selectedSocial[0],
        avatar: selectedImage,
        tags: "5",
        gender: selectedGenderInt,
      );

      print("response is $response") ;
      if(response!["success"] == true){
        Get.offAllNamed('/success');
        statusRequest = StatusRequest.success;
      }
      else{
        Get.defaultDialog(title: 'Warning', middleText: response!["message"]);
        statusRequest = StatusRequest.serverFailure;
      }
      update();
    }else{
      Get.defaultDialog(title: 'Warning', middleText: "Fill all the required fields");
    }
  }

  selectGender(String val){
    if(val == 'Male') {
      selectedGender = 'Male';
      selectedGenderInt = 1;
    }else{
      selectedGender = 'Female';
      selectedGenderInt = 0;
    }
    update();
  }

  selectSocialMedia(int index, bool value){
    checked[index] = value;
    if(checked[index] == true){
      selectedSocial.add(checkBoxList[index]);
    }else if(checked[index] ==  false && selectedSocial.contains(checkBoxList[index])){
      selectedSocial.remove(checkBoxList[index]);
    }
    print(selectedSocial);
    update();
  }

  void navigateSelectedImage(File pickedImage)
  {
    selectedImage = pickedImage;
    update();
  }

  @override
   incrementSalary() async{
    if(counter < 1000){
      counter+=100;
    }else{
      return Get.defaultDialog(title: 'Warning', middleText: "Salary can't be more than 1000");
    }
    update();
  }

  @override
  void decrementSalary() async{
      if (counter > 100) {
        counter-=100;

      }else{
        return Get.defaultDialog(title: 'Warning', middleText: "Salary can't be less than 100");
      }
      update();
  }


  getDateFromUser(context) async
  {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365)),
      firstDate: DateTime(1960),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      if (pickedDate.isBefore(DateTime.now())) {
        if (pickedDate != selectedDate) {
          selectedDate = pickedDate;
          update();
        }
      } else {
        // Handle the case where the picked date is not before today
        // For example, you can show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a birth date before today.')),
        );
      }
    }
  }

}