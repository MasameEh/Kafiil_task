import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

import '../size_config.dart';
import '../themes.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  final int rowsPerPage = 8;
  int currentPage = 0;

  List<Map<String, String>> data = [
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Egypt", "capital": "Cairo"},
    {"country": "Canada", "capital": "Ottawa"},
    {"country": "India", "capital": "New Delhi"},
    {"country": "Australia", "capital": "Canberra"},
    {"country": "Brazil", "capital": "Brasilia"},
    {"country": "China", "capital": "Beijing"},
    {"country": "Russia", "capital": "Moscow"},
    {"country": "USA", "capital": "Washington D.C."},
    // Add more data here
  ];

  List<DataRow> getRows() {
    int start = currentPage * rowsPerPage;
    int end = start + rowsPerPage;
    List<Map<String, String>> pageData = data.sublist(start, end > data.length ? data.length : end);

    return pageData.map((entry) {
      return DataRow(cells: [

        DataCell(Padding(
          padding:  const EdgeInsets.only(left: 30.0),
          child: Text(entry["country"]!, style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500
          )),
        )),
        DataCell(Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(entry["capital"]!, style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500
          )),
        )),
      ]);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    int totalPages = (data.length / rowsPerPage).ceil();

    return Scaffold(
      backgroundColor: Color(0xfffbfbfb),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white38,
        flexibleSpace: const FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(left: 25, bottom: 16.0),
          title:  Text('Countries',style: TextStyle(
            color: Colors.black,
          )
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.screenWidth * .05,
            top: SizeConfig.screenHeight * .02,
            right: SizeConfig.screenWidth * .05),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
                  child: DataTable(
                    headingRowColor:  MaterialStatePropertyAll(Colors.grey.withOpacity(.08)),
                    columnSpacing: 50,
                    dataRowHeight: 35,
                    dividerThickness: 0.5,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Country',style:TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500
                          ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            'Capital',style:TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w500
                          )
                          ),
                        ),
                      ),
                    ],
                    rows: getRows(),
                  ),
                ),
            const  SizedBox(height: 20,),
            NumberPaginator(

              config: NumberPaginatorUIConfig(

                buttonShape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                    color: Colors.grey.withOpacity(.3)
                  )
                ),
                buttonUnselectedBackgroundColor: Colors.white,
                buttonSelectedBackgroundColor: primaryColor,
                buttonUnselectedForegroundColor: Colors.black,
              ),

              numberPages: totalPages,
              onPageChange: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}