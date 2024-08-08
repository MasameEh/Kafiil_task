import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/services_controller.dart';
import '../shared/class/statusrequest.dart';
import '../shared/widgets/serviceitem.dart';

class ServicesScreen extends StatelessWidget {

  ServicesControllerImp con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbfbfb),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xfffbfbfb),
        flexibleSpace: const FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(left: 10, bottom: 16.0),
          title:  Text('Services',style: TextStyle(
            color: Colors.black,
          )
          ),
        ),
      ),
      body: GetBuilder<ServicesControllerImp>(
        builder: (controller) {
          if(controller.statusRequest == StatusRequest.loading){
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 215,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: con.allServices.length,
                      itemBuilder: (context, index) {
                        return ServiceItem(
                          price: "\$${con.allServices[index]['price']!.toString()}",
                          title: con.allServices[index]['title']!,
                          avgRating: con.allServices[index]['average_rating']!.toString(),
                          imageUrl: con.allServices[index]['main_image']!  ,
                          salesCount: con.allServices[index]['completed_sales_count']!.toString(),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Popular Services',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 215,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: con.allPopularServices.length,
                      itemBuilder: (context, index) {
                        return ServiceItem(
                          price: "\$${con.allPopularServices[index]['price']!.toString()}",
                          title: con.allPopularServices[index]['title']!,
                          avgRating: con.allPopularServices[index]['average_rating']!.toString(),
                          imageUrl: con.allPopularServices[index]['main_image']!  ,
                          salesCount: con.allPopularServices[index]['completed_sales_count']!.toString(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
