import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../shared_widgets/defaultbutton.dart';
import '../shared_widgets/inputfield.dart';
import '../shared_widgets/stringmultilinetags.dart';
import '../shared_widgets/user_image.dart';
import '../size_config.dart';
import '../themes.dart';
import 'layout_screen.dart';

class CompleteData extends StatefulWidget {
  const CompleteData({super.key});

  @override
  State<CompleteData> createState() => _CompleteDataState();
}

class _CompleteDataState extends State<CompleteData> {

  int _counter = 1000;
  String? _selectedGender;
  List<String> checkBoxList = ['Facebook', 'Twitter', 'Linkedin'];
  List<bool?> checked = [false,false,false];
  File? selectedImage;

  List<Icon> mediaIcons = [
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
  DateTime _selectedDate = DateTime.now();

  void navigateSelectedImage(File pickedImage)
  {
    setState(() {
      selectedImage = pickedImage;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter+=100;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter-=100;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(left: 42, bottom: 16.0),
          title: Text('Register',style: TextStyle(
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
      body: Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.screenHeight * .02,
            left: SizeConfig.screenWidth * .05,
            right: SizeConfig.screenWidth * .05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: SizeConfig.screenWidth * .16),
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
                    margin: EdgeInsets.only(left: SizeConfig.screenWidth * .25),
                    color: Colors.white,
                    child: const Text('Complete Data', style:
                    TextStyle(
                        color: primaryColor,
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
                         radius: 12 ,
                         backgroundColor:
                         primaryColor,
                         child: Center(
                             child:
                              Icon(Icons.done,
                                color:
                                Colors.white,
                                size: 15  ,
                              )
                         ),
                       ),
                   Container(
                     width: SizeConfig.screenWidth * .37,
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
                         child: Text('2',
                             style: TextStyle(
                               color: primaryColor,
                               fontSize: 12,
                               fontWeight: FontWeight.w600
                             ),
                         ),
                     ),
                   ),
                   Container(
                     width: SizeConfig.screenWidth * .18,
                     height: 2,
                     decoration: BoxDecoration(
                       color: Colors.grey[200],
                     ),
                   ),
                 ],
              ),
              const SizedBox(
                height: 15  ,
              ),
              UserImage(onPickImage: navigateSelectedImage),
              const InputField(
                title: 'About',
                type: TextInputType.multiline,
                height: 120,
              ),
              const SizedBox(
                height: 10  ,
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Salary',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  height: 60,
                  width: SizeConfig.screenWidth, // Adjust width as necessary
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                    ),
                    color: Colors.grey[50],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center ,
                    children: [
                      IconButton(
                        icon: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white, // Circle background color
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0.5,
                                blurRadius: 3,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.remove,
                            color: primaryColor,
                          ),
                        ),
                        onPressed: _decrementCounter,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60, right: 60),
                        child: Text(
                          'SAR $_counter',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white, // Circle background color
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 0.5,
                                blurRadius: 3,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.add,
                            color: primaryColor,
                          ),
                        ),
                        onPressed: _incrementCounter,
                      ),
                    ],
                  ),
                ),
              ],
            ),

              const SizedBox(
                height: 10 ,
              ),
              InputField(
                  title: 'Birth Date',
                  type: TextInputType.datetime,
                  readOnly: true,
                  hint: _selectedDate != null ? DateFormat('yyyy-MM-dd').format(_selectedDate) : '',
                  suffix: Icons.calendar_month_outlined,
                  suffixPressed: _getDateFromUser,
              ),
              const SizedBox(
                height: 10 ,
              ),
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
                        child: RadioListTile<String>(
                          contentPadding: const EdgeInsets.all(0),
                          value: 'Male',
                          groupValue: _selectedGender,
                          title: const Text('Male'),
                          activeColor: primaryColor,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          value: 'Female',
                          contentPadding: const EdgeInsets.all(0),
                          groupValue: _selectedGender,
                          title: const Text('Female'),
                          activeColor: primaryColor,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: SizeConfig.screenWidth * .29,)
                    ],
                  ),
                ],
              ),
              const StringMultilineTags(),
              const SizedBox(
                height: 15,
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
                    for (var i = 0; i < checked.length; i += 1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
                            onChanged: i == checked.length ? null : (bool? value) {
                              setState(() {
                                checked[i] = value;
                              });
                            },
                            value: checked[i],
                            activeColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          const SizedBox(width: 8,),
                          mediaIcons[i],
                          const SizedBox(width: 8,),
                          Text(
                            checkBoxList[i],
                            ),
                        ],
                      ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              DefaultButton(
                label: 'Submit',

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeLayout(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

    _getDateFromUser() async
    {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2030),
        // builder: (context,  child)
        // {
        //   return Theme(
        //     data: Theme.of(context).copyWith(
        //       colorScheme: Get.isDarkMode ? const ColorScheme.dark(
        //         // primary: Colors.white, // header background color
        //           brightness: Brightness.dark
        //       ) : const ColorScheme.light(
        //           primary: bluishClr, // header background color
        //           brightness: Brightness.light
        //       ),
        //       textButtonTheme: TextButtonThemeData(
        //         style: TextButton.styleFrom(
        //           foregroundColor: bluishClr, // button text color
        //         ),
        //       ),
        //     ),
        //     child: child!,
        //   );
        // }
      );
      if (pickedDate != null && pickedDate != _selectedDate) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    }

}
