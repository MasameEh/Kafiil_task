import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafil/screens/login_screen.dart';

import '../shared_widgets/defaultbutton.dart';
import '../shared_widgets/inputfield.dart';
import '../shared_widgets/stringmultilinetags.dart';
import '../shared_widgets/user_image.dart';
import '../size_config.dart';
import '../themes.dart';

class WhoAmIScreen extends StatefulWidget {
  const WhoAmIScreen({super.key});

  @override
  State<WhoAmIScreen> createState() => _WhoAmIScreenState();
}

class _WhoAmIScreenState extends State<WhoAmIScreen> {
  File? selectedImage;
  bool isPass = true;
  bool isChecked = false;
  final String _selectedGender = 'Male';
  String _selectedUserType = 'Seller';
  TextEditingController passController = TextEditingController(text: "123456");


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
  void changePasswordVisibility() {
    setState(() {
      isPass = !isPass;
    });
    suffix = isPass ? Icons.visibility_off_outlined : Icons.visibility_outlined;
  }

  void navigateSelectedImage(File pickedImage)
  {
    setState(() {
      selectedImage = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: const FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(left: 25, bottom: 16.0),
          title:  Text('Who Am I',style: TextStyle(
            color: Colors.black,
          )
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.screenWidth * .05,
            top: SizeConfig.screenHeight * .02,
            right: SizeConfig.screenWidth * .05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserImage(onPickImage: navigateSelectedImage),
              const Row(
                children: [
                  Expanded(
                    child: InputField(
                        title: 'First Name',
                        readOnly: true,
                        hint: 'Mohamed',
                        type: TextInputType.text
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InputField(
                        title: 'Last Name',
                        readOnly: true,
                        hint: 'Sameh',
                        type: TextInputType.text
                    ),
                  )
                ],
              ),
              const InputField(
                  title: 'Email Address',
                  hint: 'samehms116@gmail.com',
                  readOnly: true,
                  type: TextInputType.text,
              ),
              InputField(
                title: 'Password',
                type: TextInputType.visiblePassword,
                controller: passController,
                readOnly: true,
                isPassword: isPass,
                suffix: suffix,
                suffixPressed: changePasswordVisibility,
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
                          onTap: () {

                          },
                          child: Row(
                            children: [
                              Radio<String>(
                                value: 'Seller',
                                groupValue: _selectedUserType,
                                activeColor: primaryColor,
                                onChanged: (value) {

                                },
                              ),
                              const Text('Seller'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {

                          },
                          child: Row(
                            children: [
                              Radio<String>(
                                value: 'Buyer',
                                groupValue: _selectedUserType,
                                activeColor: primaryColor,
                                onChanged: (value) {

                                },
                              ),
                              const Text('Buyer'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                          },
                          child: Row(
                            children: [
                              Radio<String>(
                                value: 'Both',
                                groupValue: _selectedUserType,
                                activeColor: primaryColor,
                                onChanged: (value) {

                                },
                              ),
                              const Text('Both'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: SizeConfig.screenWidth * .15),
                    ],
                  ),

                ],
              ),
              const InputField(
                title: 'About',
                type: TextInputType.multiline,
                readOnly: true,
                hint: 'Lorem ipsum dolor sit amet, '
                    'consectetur adipiscing elit. Nullam vehicula massa nec massa tempus, '
                    'sit amet mollis justo molestie. Quisque sit amet interdum ligula.',
                height: 120,
              ),
              const InputField(
                title: 'Salary',
                type: TextInputType.text,
                hint: 'SAR 4500',
                readOnly: true,
              ),
              const InputField(
                title: 'Birth Date',
                type: TextInputType.datetime,
                readOnly: true,
                hint: '2000-6-11',
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
                          onTap: () {

                          },
                          child: Row(
                            children: [
                              Radio<String>(
                                value: 'Male',
                                groupValue: _selectedGender,
                                activeColor: primaryColor,
                                onChanged: (value) {

                                },
                              ),
                              const Text('Male'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {

                          },
                          child: Row(
                            children: [
                              Radio<String>(
                                value: 'Female',
                                groupValue: _selectedGender,
                                activeColor: primaryColor,
                                onChanged: (value) {

                                },
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
              const StringMultilineTags(),
              const SizedBox(height: 10,),
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
                  for (var i = 0; i < checked.length; i += 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
                          value: checked[i],
                          activeColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3 ),
                          ), onChanged: (bool? value) {  },
                        ),
                        const SizedBox(width: 8,),
                        mediaIcons[i],
                        const SizedBox(width: 8,),
                        Text(
                          checkBoxList[i], style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 20,),
              DefaultButton(
                label: 'Log out',
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                        (route) {
                          return false;
                        },
                  );
                },
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
