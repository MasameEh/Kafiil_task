import 'package:flutter/material.dart';

import '../../themes.dart';

class ServiceItem extends StatelessWidget {

  final String price;
  final String title;
  final String avgRating;
  final String imageUrl;
  final String salesCount;

  const ServiceItem({super.key,
    required this.price,
    required this.title,
    required this.avgRating,
    required this.imageUrl,
    required this.salesCount});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
              offset: const Offset(0, 1), // changes position of shadow
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
                      image: NetworkImage(imageUrl), // Replace with your image asset
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      price,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
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
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Color(0xffffd865), size: 20),
                const SizedBox(width: 4),
                Text(avgRating, style: const TextStyle(color: Color(0xffffd865), fontSize: 14)),
                const SizedBox(width: 6),
                Text('|',style: TextStyle(color: Colors.grey[400]) ),
                const SizedBox(width: 5),
                const Icon(Icons.shopping_basket, color: Colors.grey, size: 20),
                const SizedBox(width: 4),
                Text(salesCount,style: const TextStyle(color: Colors.grey) ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
