import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kafil/shared/functions/validator.dart';

import '../../controller/auth/complete_data_controller.dart';
import '../../shared/class/statusrequest.dart';
import '../../shared/widgets/defaultbutton.dart';
import '../../shared/widgets/inputfield.dart';
import '../../shared/widgets/stringmultilinetags.dart';
import '../../shared/widgets/user_image.dart';
import '../../size_config.dart';
import '../../themes.dart';

class CompleteData extends StatelessWidget {
  const CompleteData({super.key});


  @override
  Widget build(BuildContext context) {

    CompleteDataControllerImp con = Get.put(CompleteDataControllerImp());

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
      body: GetBuilder<CompleteDataControllerImp>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.screenHeight * .02,
                left: SizeConfig.screenWidth * .05,
                right: SizeConfig.screenWidth * .05),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
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
                    UserImage(onPickImage: controller.navigateSelectedImage),
                    InputField(
                      title: 'About',
                      controller: controller.aboutController,
                      type: TextInputType.multiline,
                      validator: (val) {
                        return validInput(val!, 10, 1000, "text");
                      },
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
                                onPressed: controller.decrementSalary,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 60, right: 60),
                                child: Text(
                                  'SAR ${controller.counter}',
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
                                onPressed: controller.incrementSalary,
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
                      hint: controller.selectedDate != null ? DateFormat('yyyy-MM-dd').format(controller.selectedDate) : '',
                      suffix: Icons.calendar_month_outlined,
                      suffixPressed:() {
                        controller.getDateFromUser(context);
                      },
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
                              child: InkWell(
                                onTap: () {
                                  controller.selectGender("Male");
                                },
                                child: Row(
                                  children: [
                                    Radio<String>(
                                      value: 'Male',
                                      groupValue: controller.selectedGender,
                                      activeColor: primaryColor,
                                      onChanged: (value) {
                                        controller.selectGender("Male");
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
                                  controller.selectGender('Female');
                                },
                                child: Row(
                                  children: [
                                    Radio<String>(
                                      value: 'Female',
                                      groupValue: controller.selectedGender,
                                      activeColor: primaryColor,
                                      onChanged: (value) {
                                        controller.selectGender('Female');
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
                        for (var i = 0; i < controller.checked.length; i += 1)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
                                onChanged: i == controller.checked.length ? null : (bool? value) {
                                  controller.selectSocialMedia(i, value!);
                                },
                                value: controller.checked[i],
                                activeColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              const SizedBox(width: 8,),
                              controller.mediaIcons[i],
                              const SizedBox(width: 8,),
                              Text(
                                controller.checkBoxList[i],
                              ),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ConditionalBuilder(
                      condition: controller.statusRequest != StatusRequest.loading,
                      builder: (context) => DefaultButton(
                        label: 'Submit',
                        onTap: () {
                          controller.register();
                        },
                      ),
                      fallback: (context) => const Center(
                          child: CircularProgressIndicator()),
                    ),
                    const SizedBox(
                      height: 50,
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


}
