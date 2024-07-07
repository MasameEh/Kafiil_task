import 'package:flutter/material.dart';
import 'package:kafil/screens/register_screen.dart';

import '../shared_widgets/defaultbutton.dart';
import '../shared_widgets/inputfield.dart';
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
    suffix = isPass ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Login',
            style: TextStyle(
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/login.png',
                  width: 230,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const InputField(
                  title: 'Email Address', type: TextInputType.emailAddress),
              const SizedBox(
                height: 15,
              ),
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
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
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
                height: 15,
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
                            fontWeight: FontWeight.w400,
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
