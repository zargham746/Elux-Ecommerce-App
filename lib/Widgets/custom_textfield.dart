import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
        controller: controller,
        maxLines: 1,
        cursorColor: Colors.grey,
        style: defaultStyle.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        decoration: const InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey, width: 0.4, style: BorderStyle.solid),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey, width: 0.4, style: BorderStyle.solid),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey, width: 0.4, style: BorderStyle.solid),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey, width: 0.4, style: BorderStyle.solid),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.red, width: 1, style: BorderStyle.solid),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.red, width: 1, style: BorderStyle.solid),
          ),
        ),
      ),
    );
  }
}
