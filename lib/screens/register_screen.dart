import 'package:flutter/material.dart';

import '../shared_widgets/inputfield.dart';
import '../shared_widgets/mytimelinetile.dart';
import '../size_config.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register',style: TextStyle(
          color: Colors.black,
        )
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
      body: Padding(
            padding: EdgeInsets.only(left: SizeConfig.screenWidth * .03, top: SizeConfig.screenHeight * .03, right: SizeConfig.screenWidth * .03),
            child: ListView(
              scrollDirection: Axis.horizontal,
                            children:  [
                              MyTimelineTile(
                                  isFirst: false,
                                  isLast: false,
                                  number: 1,
                                  label: 'Register',
                                  isTurn: true,
                                  isDone: false,
                              ),
                              MyTimelineTile(
                                  isFirst: false,
                                  isLast: false,
                                  number: 2,
                                  label: 'Complete data',
                                  isTurn: false,
                                  isDone: false,
                              ),
                            ],
              //   Container(
              //     child: Row(
              //       children: [
              //         Expanded(
              //             child: InputField(
              //                 title: 'First Name',
              //                 type: TextInputType.text
              //             ),
              //         ),
              //         SizedBox(width: 10),
              //         Expanded(
              //           child: InputField(
              //               title: 'Last Name',
              //               type: TextInputType.text
              //           ),
              //         )
              //       ],
              //
              //     ),
              //   ),
              //   SizedBox( height: 10,),
              //   InputField(
              //       title: 'Email Address',
              //       type: TextInputType.text
              //   ),
              // ],
            ),
            ),
    );
  }
}



