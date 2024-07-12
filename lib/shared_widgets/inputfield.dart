import 'package:flutter/material.dart';

import '../size_config.dart';

class InputField extends StatelessWidget {


  final String title;
  final String? hint;
  final IconData? suffix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final VoidCallback? suffixPressed;
  final TextInputType type;
  final bool? isPassword;
  final double height;
  final bool readOnly;
  final Function(String)? onSubmit;

  const InputField(
      {super.key,
        required this.title,
        required this.type,
        this.hint,
        this.controller,
        this.validator,
        this.isPassword,
        this.suffix,
        this.suffixPressed,
        this.height = 60,
        this.readOnly = false,
        this.onSubmit,
      });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              )),
          Container(
            padding: const EdgeInsets.only(left: 14, top: 5),
            margin: const EdgeInsets.only(top: 8),
            height: height,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white),
              color: const Color(0xfff9f9f9),
            ),
            child: TextFormField(
                obscureText: isPassword ?? false,
                controller: controller,
                readOnly: readOnly,
                autofocus: false,
                cursorColor: Colors.grey[700],
                validator: validator,
                onFieldSubmitted: onSubmit,
                keyboardType: type,
                scrollPhysics: const AlwaysScrollableScrollPhysics(),
                minLines: type == TextInputType.multiline ? 1 : null,
                maxLines: type == TextInputType.multiline ? 8 : 1,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(color: Colors.black),
                  border: InputBorder.none,
                  suffixIcon: suffix != null
                      ? IconButton(
                          onPressed: suffixPressed,
                          icon: Icon(
                            suffix,
                            // color: Colors.black54,
                            size: 20,
                          ),
                        )
                      : null,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
