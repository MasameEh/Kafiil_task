import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/widgets/defaultbutton.dart';
import '../../size_config.dart';
import '../../themes.dart';


class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text('Success',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.grey[350])),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            const Center(
                child: Icon(
                  Icons.check_circle_outline,
                  size: 200,
                  color: primaryColor,
                )),
            Text("congratulations",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontSize: 30, color: primaryColor)),
            const Text("Account successfully registered"),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            DefaultButton(
              label: 'Done',
              onTap: () {
                Get.offAllNamed('/');
              },
            ),
          ]),
        ),
      ),
    );
  }
}