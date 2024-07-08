import 'package:flutter/material.dart';

import '../size_config.dart';
import '../themes.dart';

class CompleteData extends StatelessWidget {
  const CompleteData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(left: 45, bottom: 16.0),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: SizeConfig.screenWidth * .15),
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
                  margin: EdgeInsets.only(left: SizeConfig.screenWidth * .27),
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
                   width: 70,
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
                   width: 140,
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
                   width: 60,
                   height: 2  ,
                   decoration: BoxDecoration(
                     color: Colors.grey[200]    ,
                   ),
                 ),
               ],
            ),
          ],
        ),
      ),
    );
  }
}
