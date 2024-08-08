import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../shared/class/statusrequest.dart';

abstract class CountriesController extends GetxController{
  void changePage(int index);
  void fetchAllCountries();
}

class CountriesControllerImp extends CountriesController{
  final int rowsPerPage = 8;
  int currentPage = 0;
  StatusRequest? statusRequest;

  List allCountries = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllCountries();
  }
  @override
  Future<void> fetchAllCountries() async {
    String baseUrl = "https://test.kafiil.com/api/test/country";
    int currentPage = 1;
    int totalPages = 25;
    // This will hold all the countries across all pages

    do {
      String url = "$baseUrl?page=$currentPage";
      statusRequest = StatusRequest.loading;
      update();

      // Fetch the data from the API
      var response = await http.get(Uri.parse(url), headers: {
        'Accept': 'application/json',
        'Accept-Language': 'ar'
      });

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

        if (jsonData['success'] == true) {
          // Add the countries from the current page to the allCountries list
          allCountries.addAll(jsonData['data']);

          // Update currentPage and totalPages based on the response
          currentPage = jsonData['pagination']['currentPage'];
          // totalPages = jsonData['pagination']['totalPages'];

          // Move to the next page
          currentPage++;
        } else {
          // Handle the case where the API indicates failure
          print("Failed to fetch data: ${jsonData['message']}");
          break;
        }
      } else {
        // Handle the HTTP error
        print("HTTP error: ${response.statusCode}");
        break;
      }
    } while (currentPage <= totalPages);

    // At this point, allCountries contains all the countries from all pages
    statusRequest = StatusRequest.success;
    update();
    print("Fetched ${allCountries.length} countries.");
    // You can now work with the fetched data
  }

  List<DataRow> getRows() {
    int start = currentPage * rowsPerPage;
    int end = start + rowsPerPage;
    List pageData = allCountries.sublist(start, end > allCountries.length ? allCountries.length : end);

    return pageData.map((entry) {
      return DataRow(cells: [

        DataCell(Padding(
          padding:  const EdgeInsets.only(left: 30.0),
          child: Text(entry["name"]!, style: const TextStyle(
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
  void changePage(int index){
    currentPage = index;
    update();
  }


}