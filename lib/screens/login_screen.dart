import 'package:flutter/material.dart';
import 'package:kafil/screens/register_screen.dart';

import '../shared/defaultbutton.dart';
import '../shared/error_msg.dart';
import '../shared/inputfield.dart';
import '../size_config.dart';
import '../themes.dart';
import 'layout_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPass = true;
  bool isChecked = false;
  bool isError = false;

  IconData suffix = Icons.visibility_off_outlined;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  void changePasswordVisibility() {
    setState(() {
      isPass = !isPass;
    });
    suffix = isPass ? Icons.visibility_off_outlined : Icons.visibility_outlined;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isError = false;
  }
  @override
  void dispose() {
    // Reset the error state and clear the text controllers
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
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
              ErrorMsg(show: isError),
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
                  type: TextInputType.emailAddress,
                  controller: _emailController,
              ),
              InputField(
                title: 'Password',
                onSubmit: (value)
                {
                  _validateElements();
                },
                controller: _passController,
                type: TextInputType.text,
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
                onTap: () {
                  _validateElements();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const HomeLayout(),
                  //   ),
                  // );
                },
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
                        setState(() {
                          isError = false;
                        });
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

  _validateElements() {
    if (_emailController.text.isEmpty || _passController.text.isEmpty) {
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
          builder: (context) => const HomeLayout(),
        ),
      );
    }
  }
}
