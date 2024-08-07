import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controller/who_am_i_controller.dart';
import '../shared/defaultbutton.dart';
import '../shared/inputfield.dart';
import '../shared/stringmultilinetags.dart';
import '../size_config.dart';
import '../themes.dart';

class WhoAmIScreen extends StatelessWidget {
  const WhoAmIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: const FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(left: 25, bottom: 16.0),
          title: Text('Who Am I',
              style: TextStyle(
                color: Colors.black,
              )),
        ),
      ),
      body: GetBuilder<WhoAmIControllerImp>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.screenWidth * .05,
                top: SizeConfig.screenHeight * .02,
                right: SizeConfig.screenWidth * .05),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: primaryColor,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(controller.user.avatar!),
                        ),
                      ),
                      Positioned(
                        top: 45,
                        left: 45,
                        child: TextButton.icon(
                          onPressed: () async {
                            // Your onPressed function here
                          },
                          icon: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: primaryColor,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 17,
                            ),
                          ),
                          label: const Text(''),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputField(
                            title: 'First Name',
                            controller: controller.firstNameController,
                            readOnly: true,
                            hint: controller.user.firstName,
                            type: TextInputType.text),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: InputField(
                            title: 'Last Name',
                            controller: controller.lastNameController,
                            readOnly: true,
                            hint: controller.user.lastName,
                            type: TextInputType.text),
                      )
                    ],
                  ),
                  InputField(
                    title: 'Email Address',
                    controller: controller.emailController,
                    hint: controller.user.email,
                    readOnly: true,
                    type: TextInputType.text,
                  ),
                  InputField(
                    title: 'Password',
                    type: TextInputType.visiblePassword,
                    controller: controller.passController,
                    readOnly: true,
                    isPassword: controller.isPass,
                    suffix: controller.suffix,
                    suffixPressed: controller.changePasswordVisibility,
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'User Type',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: 'seller',
                                    groupValue: controller.selectedUserType,
                                    activeColor: primaryColor,
                                    onChanged: (value) {},
                                  ),
                                  const Text('seller'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: 'buyer',
                                    groupValue: controller.selectedUserType,
                                    activeColor: primaryColor,
                                    onChanged: (value) {},
                                  ),
                                  const Text('buyer'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: 'both',
                                    groupValue: controller.selectedUserType,
                                    activeColor: primaryColor,
                                    onChanged: (value) {},
                                  ),
                                  const Text('both'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.screenWidth * .15),
                        ],
                      ),
                    ],
                  ),
                  InputField(
                    title: 'About',
                    controller: controller.aboutController,
                    type: TextInputType.multiline,
                    readOnly: true,
                    hint: controller.user.about,
                    height: 120,
                  ),
                   InputField(
                    title: 'Salary',
                    type: TextInputType.text,
                    controller: controller.salaryController,
                    hint: controller.user.salary.toString(),
                    readOnly: true,
                  ),
                   InputField(
                    title: 'Birth Date',
                    type: TextInputType.datetime,
                    controller: controller.dateController,
                    readOnly: true,
                    hint: controller.user.birthDate,
                    suffix: Icons.calendar_month_outlined,
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Gender',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: 'Male',
                                    groupValue: controller.selectedGender,
                                    activeColor: primaryColor,
                                    onChanged: (value) {},
                                  ),
                                  const Text('Male'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: 'Female',
                                    groupValue: controller.selectedGender,
                                    activeColor: primaryColor,
                                    onChanged: (value) {},
                                  ),
                                  const Text('Female'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: SizeConfig.screenWidth * .29),
                        ],
                      ),
                    ],
                  ),
                  StringMultilineTags(tags: controller.user.tags),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Favourite Social Media',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      for (var i = 0; i < controller.checked.length; i += 1)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: const VisualDensity(
                                  horizontal: -4, vertical: -2),
                              value: controller.checked[i],
                              activeColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              onChanged: (bool? value) {},
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            controller.mediaIcons[i],
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              controller.checkBoxList[i],
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultButton(
                    label: 'Log out',
                    onTap: () {
                      Get.offAllNamed("/");
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
