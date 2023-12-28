import 'package:flutter/material.dart';
import 'package:flutter_elux_app/config/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressRow extends StatelessWidget {
  final String title;
  final String description;
  const AddressRow({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title:',
          style: defaultStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.6,
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        Text(
          description,
          style: defaultStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
