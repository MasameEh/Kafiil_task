import 'package:flutter/material.dart';

import '../themes.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.label, required this.onTap});

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}