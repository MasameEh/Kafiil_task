import 'package:flutter/material.dart';

import '../themes.dart';

class ServiceItem extends StatelessWidget {

  final String price;
  final String title;

  const ServiceItem({super.key, required this.price, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.only(bottom: 20, left: 5, right: 5),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'), // Replace with your image asset
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    price,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: null,
                  overflow: TextOverflow.visible,
                  // style: TextStyle(fontWeight: FontWeight.w500, ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Color(0xffffd865), size: 20),
              SizedBox(width: 4),
              Text('(4.5)', style: TextStyle(color: Color(0xffffd865), fontSize: 14)),
              SizedBox(width: 6),
              Text('|',style: TextStyle(color: Colors.grey[400]) ),
              SizedBox(width: 5),
              Icon(Icons.shopping_basket, color: Colors.grey, size: 20),
              SizedBox(width: 4),
              Text('20',style: TextStyle(color: Colors.grey) ),
            ],
          ),
        ],
      ),
    );
  }
}
