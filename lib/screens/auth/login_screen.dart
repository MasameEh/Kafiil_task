import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafil/shared/class/statusrequest.dart';

import '../../controller/auth/login_controller.dart';
import '../../shared/functions/validator.dart';
import '../../shared/widgets/defaultbutton.dart';
import '../../shared/widgets/inputfield.dart';
import '../../size_config.dart';
import '../../themes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Get.put(LoginControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Login',
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body: GetBuilder<LoginControllerImp>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.only(left: SizeConfig.screenWidth * .05, right: SizeConfig.screenWidth * .05, top: SizeConfig.screenHeight * .04),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    // ErrorMsg(show: isError),
                    Center(
                      child: Image.asset(
                        'assets/login.png',
                        width: SizeConfig.screenWidth * 0.55,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InputField(
                      title: 'Email Address',
                      validator: (val) {
                        return validInput(val!, 8, 64, "email");
                      },
                      type: TextInputType.emailAddress,
                      controller: controller.emailController,
                    ),
                    InputField(
                      title: 'Password',
                      validator: (val) {
                        return validInput(val!, 8, 25, "password");
                      },
                      onSubmit: (value)
                      {
                        //_validateElements();
                      },
                      controller: controller.passController,
                      type: TextInputType.text,
                      isPassword: controller.isPass,
                      suffix: controller.suffix,
                      suffixPressed: controller.changePasswordVisibility,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                          value: controller.isChecked,
                          activeColor: primaryColor,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          onChanged: (bool? value) {
                            controller.selectRememberMe(value);
                          },
                        ),
                        const SizedBox(width: 5),
                        Text('Remember me',
                          style: mainTextStyle,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Forgot password?',
                                    style: mainTextStyle,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ConditionalBuilder(
                      condition: controller.statusRequest != StatusRequest.loading,
                      builder: (context) => DefaultButton(
                        label: 'Login',
                        onTap: () {
                          controller.login();
                        },
                      ),
                      fallback: (context) => const Center(
                          child: CircularProgressIndicator()),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account ?', style: mainTextStyle,),
                        TextButton(
                            onPressed: () {
                              Get.toNamed("/signup");
                            },
                            child: const Text('Register',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                )
                            )
                        ),
                      ],
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

  // _validateElements() {
  //   if (_emailController.text.isEmpty || _passController.text.isEmpty) {
  //     setState(() {
  //       isError = true;
  //     });
  //   } else {
  //     setState(() {
  //       isError = false;
  //     });
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const HomeLayout(),
  //       ),
  //     );
  //   }
  // }
}
