import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Default TextStyle
TextStyle defaultStyle = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18.sp,
  fontWeight: FontWeight.normal,
);

TextStyle hintStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: Colors.grey);

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 4),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
      ),
    ),
  );
}

const imagesFolderPath = 'assets/images/';
const iconsFolderPath = 'assets/icons/';
