import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';

import '../controller/countries_controller.dart';
import '../shared/class/statusrequest.dart';
import '../size_config.dart';
import '../themes.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CountriesControllerImp controller = Get.find();
    int totalPages =
        (controller.allCountries.length / controller.rowsPerPage).ceil();

    return Scaffold(
      backgroundColor: const Color(0xfffbfbfb),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white38,
        flexibleSpace: const FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(left: 25, bottom: 16.0),
          title: Text('Countries',
              style: TextStyle(
                color: Colors.black,
              )),
        ),
      ),
      body: GetBuilder<CountriesControllerImp>(
        builder: (controller) {
          if(controller.statusRequest == StatusRequest.loading){
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.screenWidth * .05,
                top: SizeConfig.screenHeight * .02,
                right: SizeConfig.screenWidth * .05),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.08),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: DataTable(
                    headingRowColor:
                    MaterialStatePropertyAll(Colors.grey.withOpacity(.08)),
                    columnSpacing: 50,
                    dataRowHeight: 40,
                    dividerThickness: 0.5,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Country',
                            style: TextStyle(
                                color: Colors.black45, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text('Capital',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                    rows: controller.getRows(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                NumberPaginator(
                  config: NumberPaginatorUIConfig(
                    buttonShape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: Colors.grey.withOpacity(.3))),
                    buttonUnselectedBackgroundColor: Colors.white,
                    buttonSelectedBackgroundColor: primaryColor,
                    buttonUnselectedForegroundColor: Colors.black,
                  ),
                  numberPages: totalPages,
                  onPageChange: (index) {
                    controller.changePage(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
