import 'package:flutter/material.dart';

class ErrorMsg extends StatelessWidget {

  const ErrorMsg({super.key, required this.show});

  final bool show;
  @override
  Widget build(BuildContext context) {
    if(show == true){
      //if error is true then show error message box
      return Container(
        padding: const EdgeInsets.only(left: 20,top: 5,right: 10,bottom: 5),
        margin: const EdgeInsets.only(bottom: 20.00),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.red.withOpacity(.1),
        ),
        child: Row(children: [
          Container(
            margin: EdgeInsets.only(right:6.00),
            child: Icon(Icons.info_outline, color: Colors.red[300]),
          ), // icon for error message

          Text('Fill the required fields', style: TextStyle(color: Colors.red[300])),
          //show error message text
        ]),
      );
    }else{
      return Container();
      //if error is false, return empty container.
    }
  }
}
