import 'package:flutter/material.dart';

import '../shared_widgets/serviceitem.dart';

class ServicesScreen extends StatelessWidget {

  final List<Map<String, String>> services = [
    {"price": "\$100", "title": "Logo Design -Graphic Design Graphic Design ",},
    {"price": "\$100", "title": "Logo Design -Graphic Design Graphic Design ",},
    {"price": "\$100", "title": "Logo Design -Graphic Design Graphic Design ",},
    {"price": "\$100", "title": "Logo Design -Graphic Design Graphic Design",},
    {"price": "\$100", "title": "Logo Design -Graphic Design Graphic Design",},
    {"price": "\$100", "title": "Logo Design -Graphic Design Graphic Design",},
    {"price": "\$100", "title": "Logo Design -Graphic Design Graphic Design",},
    {"price": "\$100", "title": "Logo Design -Graphic Design Graphic Design",},
    {"price": "\$120", "title": "Logo Design - Graphic Design Graphic Design",},
    // Add more items as needed
  ];

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 215,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return ServiceItem(
                      price: services[index]['price']!,
                      title: services[index]['title']!,
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
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return ServiceItem(
                      price: services[index]['price']!,
                      title: services[index]['title']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
