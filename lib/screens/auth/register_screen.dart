
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafil/shared/widgets/error_msg.dart';
import 'package:kafil/shared/functions/validator.dart';

import '../../controller/auth/register_controller.dart';
import '../../shared/widgets/defaultbutton.dart';
import '../../shared/widgets/inputfield.dart';
import '../../size_config.dart';
import '../../themes.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    RegisterControllerImp con = Get.put(RegisterControllerImp());

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(left: 42, bottom: 16.0, top: 45),
          title:  Text('Register',style: TextStyle(
            color: Colors.black,
          )),
        ),
        leading: IconButton(
              iconSize: 20,
              onPressed: () {
                con.isError = false;
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
      body: GetBuilder<RegisterControllerImp>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth * .05,
                  top: SizeConfig.screenHeight * .02,
                  right: SizeConfig.screenWidth * .05),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    ErrorMsg(show: controller.isError,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: SizeConfig.screenWidth * .16)
                          ,
                          color: Colors.white,
                          child: const Text('Register', style:
                          TextStyle(
                              color: primaryColor,
                              fontSize: 13      ,
                              fontWeight: FontWeight.w600
                          ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: SizeConfig.screenWidth * .25),
                          color: Colors.white,
                          child: Text('Complete Data', style:
                          TextStyle(
                              color: Colors.grey[350],
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                          ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10  ,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: SizeConfig.screenWidth * .2,
                          height: 2,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                          ),
                        ),
                        const CircleAvatar(
                          radius: 12,
                          backgroundColor: primaryColor,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                            child: Text('1',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth * .37,
                          height: 2,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                        ),
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.grey[200],
                        ),
                        Container(
                          width: SizeConfig.screenWidth * .18,
                          height: 2,
                          decoration: BoxDecoration(
                            color: Colors.grey[200] ,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: InputField(
                              title: 'First Name',
                              controller: controller.firstNameController,
                              validator: (val) {
                                return validInput(val!, 2, 50, "name");
                              },
                              type: TextInputType.text
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: InputField(
                              title: 'Last Name',
                              controller: controller.lastNameController,
                              validator: (val) {
                                return validInput(val!, 2, 50, "name");
                              },
                              type: TextInputType.text
                          ),
                        )
                      ],
                    ),
                    InputField(
                        title: 'Email Address',
                        controller: controller.emailController,
                        validator: (val) {
                          return validInput(val!, 8, 64, "email");
                        },
                        type: TextInputType.text,
                    ),
                    InputField(
                      title: 'Password',
                      controller: controller.passController,
                      type: TextInputType.text,
                      isPassword: controller.isPass,
                      validator: (val) {
                        return validInput(val!, 8, 25, "password");
                      },
                      suffix: controller.suffix,
                      suffixPressed: controller.changePasswordVisibility,
                    ),
                    InputField(
                      title: 'Confirm Password',
                      validator: (val) {
                        return validInput(val!, 8, 25, "password");
                      },
                      controller: controller.confirmpassController,
                      type: TextInputType.text,
                      isPassword: controller.isPassConf,
                      suffix: controller.suffixConf,
                      suffixPressed: controller.changePasswordConfVisibility,
                    ),
                    const SizedBox(height: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                            'User Type',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13  ,
                              fontWeight: FontWeight.w400,
                            )
                        ),
                         DropdownButtonFormField<String>(
                            value: controller.selectedUserType,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xfff9f9f9),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide.none
                              ),
                            ),
                            items: ['Buyer', 'Seller', 'Both']
                                .map((label) => DropdownMenuItem(
                              value: label,
                              child: Text(label),
                            ))
                                .toList(),
                            onChanged: (value) {
                              controller.userTypeSelect(value);
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select an option';
                              }
                            },
                          ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    DefaultButton(
                        label: 'Next',
                        width: SizeConfig.screenWidth * 0.4,
                        margin: EdgeInsets.only(left: SizeConfig.screenWidth * 0.5),
                        onTap: () {
                          controller.gotoCompleteData();
                        }
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget errmsg(bool show){
  //   //error message widget.
  //   if(show == true){
  //     //if error is true then show error message box
  //     return Container(
  //       padding: const EdgeInsets.only(left: 20,top: 5,right: 10,bottom: 5),
  //       margin: const EdgeInsets.only(bottom: 20.00),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(8),
  //         color: Colors.red.withOpacity(.1),
  //       ),
  //       child: Row(children: [
  //         Container(
  //           margin: EdgeInsets.only(right:6.00),
  //           child: Icon(Icons.info_outline, color: Colors.red[300]),
  //         ), // icon for error message
  //
  //         Text('Fill the required fields', style: TextStyle(color: Colors.red[300])),
  //         //show error message text
  //       ]),
  //     );
  //   }else{
  //     return Container();
  //     //if error is false, return empty container.
  //   }
  // }

}



