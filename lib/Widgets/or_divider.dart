import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/constants.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 0.6,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            "Or",
            style: defaultStyle.copyWith(
              color: Colors.black,
              fontSize: 14.sp,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 0.6,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
