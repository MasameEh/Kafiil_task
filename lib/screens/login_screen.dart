import 'package:flutter/material.dart';
import 'package:kafil/screens/register_screen.dart';

import '../shared_widgets/defaultbutton.dart';
import '../shared_widgets/inputfield.dart';
import '../size_config.dart';
import '../themes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPass = false;
  bool isChecked = false;

  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    setState(() {
      isPass = !isPass;
    });
    suffix = isPass ? Icons.visibility_off_outlined : Icons.visibility_outlined;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Login',
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: SizeConfig.screenWidth * .05, right: SizeConfig.screenWidth * .05, top: SizeConfig.screenHeight * .04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/login.png',
                  width: SizeConfig.screenWidth * 0.55,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const InputField(
                  title: 'Email Address', type: TextInputType.emailAddress),
              InputField(
                title: 'Password',
                type: TextInputType.visiblePassword,
                isPassword: isPass,
                suffix: suffix,
                suffixPressed: changePasswordVisibility,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: primaryColor,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
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
              DefaultButton(
                label: 'Login',
                onTap: () {},
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
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
  }
}
