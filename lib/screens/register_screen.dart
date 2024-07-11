
import 'package:flutter/material.dart';
import 'package:kafil/shared_widgets/error_msg.dart';

import '../shared_widgets/defaultbutton.dart';
import '../shared_widgets/inputfield.dart';
import '../size_config.dart';
import '../themes.dart';
import 'complete_data.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPass = true;
  bool isPassConf = true;
  bool isChecked = false;
  bool isError = false;
  IconData suffix = Icons.visibility_off_outlined;
  IconData suffixConf = Icons.visibility_off_outlined;

  String? _selectedValue;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmpassController = TextEditingController();



  final _formKey = GlobalKey<FormState>();

  void changePasswordVisibility() {
    setState(() {
      isPass = !isPass;
    });
    suffix = isPass ? Icons.visibility_off_outlined : Icons.visibility_outlined;
  }
  void changePasswordConfVisibility() {
    setState(() {
      isPassConf = !isPassConf;
    });
    suffixConf = isPassConf ? Icons.visibility_off_outlined : Icons.visibility_outlined;
  }

  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(left: 42, bottom: 16.0),
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    ErrorMsg(show: isError,),
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
                                controller: _firstNameController,
                                type: TextInputType.text
                            ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: InputField(
                              title: 'Last Name',
                              controller: _lastNameController,
                              type: TextInputType.text
                          ),
                        )
                      ],
                    ),
                     InputField(
                        title: 'Email Address',
                        controller: _emailController,
                        type: TextInputType.text
                    ),
                    InputField(
                      title: 'Password',
                      controller: _passController,
                      type: TextInputType.text,
                      isPassword: isPass,
                      suffix: suffix,
                      suffixPressed: changePasswordVisibility,
                    ),
                    InputField(
                      title: 'Confirm Password',
                      controller: _confirmpassController,
                      type: TextInputType.text,
                      isPassword: isPassConf,
                      suffix: suffixConf,
                      suffixPressed: changePasswordConfVisibility,
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
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            items: ['Seller', 'Buyer', 'Both']
                                .map((label) => DropdownMenuItem(
                              value: label,
                              child: Text(label),
                            ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
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
                        _validateElements();
                      }
                      //   if (_formKey.currentState!.validate())
                      //   {
                      //
                      //   }
                      //   // Navigator.push(
                      //   //   context,
                      //   //   MaterialPageRoute(
                      //   //     builder: (context) => const CompleteData(),
                      //   //   ),
                      //   // );
                      // },
                    ),
                    ],
                ),
              ),
        ),
      ),
    );
  }
  _validateElements()
  {
    if(_emailController.text.isEmpty || _passController.text.isEmpty
        || _confirmpassController.text.isEmpty ||
        _firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty
        || _selectedValue!.isEmpty)
    {
      setState(() {
        isError = true;
      });

    } else {
      setState(() {
      isError = false;
    });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CompleteData(),
          ),
        );
    }

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



