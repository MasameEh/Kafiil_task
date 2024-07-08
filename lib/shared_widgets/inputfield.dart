import 'package:flutter/material.dart';

import '../size_config.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.title, required this.type,this.hint, this.controller, this.validator, this.isPassword, this.suffix, this.suffixPressed});

  final String title;
  final String? hint;
  final IconData? suffix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final VoidCallback? suffixPressed;
  final TextInputType type;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            )
          ),
          Container(
            padding: const EdgeInsets.only(left: 14),
            margin: const EdgeInsets.only(top: 8),
            height: 60,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: Colors.white
              ),
              color: Colors.grey[50],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    obscureText: isPassword ?? false,
                    controller: controller,
                    autofocus: false,
                    cursorColor: Colors.grey[700],
                    validator: validator,
                    keyboardType: type,
                    decoration: InputDecoration(
                      hintText: hint,
                      border: InputBorder.none,
                      suffixIcon: suffix != null
                          ? IconButton(
                            onPressed: suffixPressed,
                            icon: Icon(
                              suffix,
                            ),
                          ) : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
