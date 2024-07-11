import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: const FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(left: 25, bottom: 16.0),
          title:  Text('Services',style: TextStyle(
            color: Colors.black,
          )
          ),
        ),
      ),
      body: Center(child: Text('Services Screen')),
    );
  }
}
