import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

import '../shared_widgets/defaultbutton.dart';
import '../shared_widgets/inputfield.dart';
import '../shared_widgets/mytimelinetile.dart';
import '../size_config.dart';
import '../themes.dart';
import 'complete_data.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPass = false;
  bool isChecked = false;

  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    setState(() {
      isPass = !isPass;
    });
    suffix = isPass ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  }
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(left: 45, bottom: 16.0),
          title:  Text('Register',style: TextStyle(
            color: Colors.black,
          )
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          child: Container(
            width: 34.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white.withOpacity(.3),
            ),
            child: IconButton(
              iconSize: 20,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.screenWidth * .05,
                  top: SizeConfig.screenHeight * .02,
                  right: SizeConfig.screenWidth * .05),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.screenWidth * .15)
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
                            left: SizeConfig.screenWidth * .27),
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
                        width: 70,
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
                        width: 140,
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
                        width: 60,
                        height: 2  ,
                        decoration: BoxDecoration(
                          color: Colors.grey[200] ,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Row(
                    children: [
                      Expanded(
                          child: InputField(
                              title: 'First Name',
                              type: TextInputType.text
                          ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: InputField(
                            title: 'Last Name',
                            type: TextInputType.text
                        ),
                      )
                    ],

                  ),
                  const InputField(
                      title: 'Email Address',
                      type: TextInputType.text
                  ),
                  InputField(
                    title: 'Password',
                    type: TextInputType.visiblePassword,
                    isPassword: isPass,
                    suffix: suffix,
                    suffixPressed: changePasswordVisibility,
                  ),
                  InputField(
                    title: 'Confirm Password',
                    type: TextInputType.visiblePassword,
                    isPassword: isPass,
                    suffix: suffix,
                    suffixPressed: changePasswordVisibility,
                  ),
                  const SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'User Type',
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 13  ,
                            fontWeight: FontWeight.w400,
                          )
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 14),
                        margin: const EdgeInsets.only(top: 8),
                        height: 60,
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Colors.white
                          ),
                          color: Colors.grey[50],
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          items: ['Seller', 'Buyer', 'Both']
                              .map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          ))
                              .toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  DefaultButton(
                    label: 'Next',
                    width: SizeConfig.screenWidth * 0.4,
                    margin: EdgeInsets.only(left: SizeConfig.screenWidth * 0.5),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CompleteData(),
                        ),
                      );
                    },
                  ),
                  ],
              ),
        ),
      ),
    );
  }
}



